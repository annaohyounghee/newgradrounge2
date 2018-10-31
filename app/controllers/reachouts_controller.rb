class ReachoutsController < ApplicationController
    before_action :set_reachout, only: [:show, :edit, :update, :destroy, :follow, :unfollow, :save, :unsave, :pin, :unpin]
    before_action :authenticate_user!
    impressionist actions: [:show]

    def index
        search = params[:term].present? ? params[:term] : nil 
        if search
            @reachouts = Reachout.search(search, 
                      fields: [:title, :reachout_type, :interest, 'user_firstname_from_relation', 'user_lastname_from_relation', 'tag_from_relation', 'skill_from_relation'], 
                      match: :word_start,
                      order: {_score: :desc },
                      page: params[:page],
                      highlight: true
                     )
        else
            if params[:tag].present?
                @reachouts = Reachout.order("created_at DESC").tagged_with(params[:tag]).page(params[:page])
            else
                @reachouts = Reachout.order("created_at DESC").page(params[:page])
            end
        end
    end
  
    def show
        @message_has_been_sent = conversation_exist?
    end

    def new
        @reachout = current_user.reachouts.build
    end

    def edit
    end

    def create
        @reachout = current_user.reachouts.build(reachout_params)
        respond_to do |format|
            if @reachout.save
                format.html { redirect_to @reachout, notice: 'Reachout was successfully created.' }
                format.json { render :show, status: :created, location: @reachout }
            else
                format.html { render :new }
                format.json { render json: @reachout.errors, status: :unprocessable_entity }
            end
         end
    end

    def update
        respond_to do |format|
            if @reachout.update(reachout_params)
                format.html { redirect_to @reachout, notice: 'Reachout was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end

    def destroy
        @reachout.destroy
        respond_to do |format|
            format.html { redirect_to created_path, notice: 'Reachout was successfully deleted.' }
        end
    end

    def follow
        current_user.follow(@reachout)
        respond_to :js
    end

    def unfollow
        current_user.stop_following(@reachout)
        respond_to do |format|
            format.html { redirect_to followed_path(@reachout), notice: 'Reachout was successfully unfollowed.' }
            format.js
        end
    end

    def pin
        @pin = Pin.new
        @pin.user = current_user.id
        @pin.reachout = @reachout.id
        @save = @pin.save
        respond_to do |format|
            format.js
        end
    end

    def unpin
        @pin = Pin.where(user: current_user.id, reachout: @reachout.id).first
        @pin.destroy
        respond_to do |format|
            format.js
        end
    end


    def save
        @save = Save.new
        @save.user = current_user.id
        @save.reachout = @reachout.id
        @save = @save.save
        respond_to do |format|
            format.html { redirect_to root_path, notice: 'Reachout was successfully saved.' }
            format.js
        end
    end

    def unsave
        @save = Save.where(user: current_user.id, reachout: @reachout.id).first
        @save.destroy
        respond_to do |format|
            format.html { redirect_to saved_path, notice: 'Reachout was successfully unsaved.' }
            format.js
        end
    end

    def followed
        @follows = current_user.all_follows
    end

    def created
        @reachouts = current_user.reachouts
    end

    def saved
        @saves = Save.where(user: current_user.id)
    end


    private
        # Use callbacks to share common setup or constraints between actions.
        def set_reachout
            @reachout = Reachout.find(params[:id])
        end

        def conversation_exist? 
            Private::Conversation.between_users(current_user.id, @reachout.user.id).present?
        end
        # Never trust parameters from the scary internet, only allow the white list through.
        def reachout_params
            params.require(:reachout).permit(:title, :description, :back_story, :reachout_type, :tag_list, :format, :duration, :string, :reachout_when, :reachout_where, :compensation, :mescellaneous, :audience => [], :interest => [])
        end
end
