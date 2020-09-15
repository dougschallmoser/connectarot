class ThoughtsController < ApplicationController

    def create
        entry = Entry.find_by(id: params[:entry_id])
        thought = entry.thoughts.build(thought_params)
        if thought.save
            #message
        else
            #message
        end
        redirect_to entry_path(entry.id)
    end

    def destroy
        thought = Thought.find_by(id: params[:id])
        entry = thought.entry
        thought.destroy
        redirect_to entry_path(entry.id)
    end

    private

    def thought_params
        params.require(:thought).permit(:content)
    end

end