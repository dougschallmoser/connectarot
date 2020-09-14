class EntriesController < ApplicationController

    before_action :set_user, only: [:show, :new]
    before_action :set_entry, only: [:show, :update, :destroy]

    def show
    end

    def new
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

    def destroy
        @entry.destroy
        redirect_to user_path(current_user)
    end

    private

    def set_user
        @user = User.find_by(id: params[:user_id])
    end

    def set_entry
        @entry = Entry.find_by(id: params[:id])
    end

    def entry_params
        params.require(:entry).permit(:user_id, :category_id)
    end

end