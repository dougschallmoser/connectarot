class ThoughtsController < ApplicationController

    def create
        entry = Entry.find_by(id: params[:entry_id])
        thought = entry.thoughts.build(thought_params)
        if thought.save
            #message
        else
            #message
        end
        redirect_to user_entry_path(params[:user_id], entry.id)
    end

    def destroy
        thought = Thought.find_by(id: params[:id])
        thought.destroy
        redirect_to user_entry_path(params[:user_id], params[:entry_id])
    end

    private

    def thought_params
        params.require(:thought).permit(:content)
    end

end