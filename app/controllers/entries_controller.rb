class EntriesController < ApplicationController

    def show
        @user = User.find_by(id: params[:user_id])
        @entry = Entry.find_by(id: params[:id])
    end

    def new
        @user = User.find_by(id: params[:user_id])
        @entry = @user.entries.build
    end

    def create
        if params[:entry_id].present?
            @entry = Entry.find_by(id: params[:entry_id])
        else
            @entry = Entry.create(entry_params)
        end
        @entry.add_randomized_card
        redirect_to user_entry_path(@entry.user, @entry)
    end

    private

    def entry_params
        params.require(:entry).permit(:user_id, :category_id)
    end

end