class EventcommentsController < ApplicationController


  def create
        
        @eventcomment = @eventcommentable.eventcomments.new(eventcomment_params)
        @eventcomment.user_id=current_user.id
       
        respond_to do |format|

          if @eventcomment.save
        
          
              format.html { redirect_to events_path, notice: "Comment was successfully created."}
              format.json { render :show, status: :created, location: @eventcommentable }
        
          else
            format.html { redirect_to events_path, notice: 'Comment failed to be created.' }
            format.json { render :show, status: :created, location: @eventcommentable }
        
          end
        
    
        end
  end
    
  def destroy
        @eventcomment = Eventcomment.find(params[:id])
        if @eventcomment.destroy
          respond_to do |format|
            format.js
          end
        end
  end

      private
      def eventcomment_params
        params.require(:eventcomment).permit(:content,:event)
      end

    

end
