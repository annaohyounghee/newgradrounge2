class Reachouts::CommentsController < CommentsController
    before_action :set_commentable

    private
        def set_commentable
            @commentable = Reachout.find(params[:reachout_id])
        end
end