class CommentsController < ApplicationController
  
     def create
        @comment = @commentable.comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save!

        respond_to do |format|
            if @comment.save
              format.html { redirect_to reachouts_path, notice: 'Comment was successfully created.' }
              format.json { render :show, status: :created, location: @commentable }
            else
                format.html { redirect_to reachouts_path, notice: 'Comment failed to be created.' }
                format.json { render :show, status: :created, location: @commentable }
            end
          end
     end
  
     private
  
     def comment_params
        params.require(:comment).permit(:content, :ancestry)
     end
end
