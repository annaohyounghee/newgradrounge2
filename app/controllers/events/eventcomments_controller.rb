class Events::EventcommentsController < EventcommentsController
    before_action :set_eventcommentable

    private
        def set_eventcommentable
            @eventcommentable = Event.find(params[:event_id])
        end
end