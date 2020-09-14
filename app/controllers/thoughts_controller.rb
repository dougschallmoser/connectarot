class ThoughtsController < ApplicationController

    def create
        thought = Thought.new(thought_params)
        if thought.save
            #message
        else
            #message
        end
        redirect_to user_entry_path(params[:user_id], params[:entry_id])
    end

    private

    def thought_params
        params.require(:thought).permit(:content, :entry_id)
    end

end