class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :edit_skills, :update]

    def new
        @profile = Profile.new
    end

    def create
        @profile = Profile.new(profile_params)
    end

    def edit
    	@user = current_user
    end

    def show
        @user = User.find(@profile.user_id)
    end

    def edit_skills
        respond_to :js
    end

    def update
        respond_to do |format|
            if @profile.update(profile_params)
                format.html { redirect_to edit_profile_path(@profile), notice: 'Skills was successfully updated.' }
            else
                format.js { render :edit }
            end
        end
    end

    private

    def set_profile
        @profile = Profile.find(params[:id])
    end

    def profile_params
        params.require(:profile).permit(:tag_list) ## Rails 4 strong params usage
    end

end
