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
            @entry = Entry.create(user_id: params[:user_id])
        end
        @random_card = Card.randomize
        until !@entry.cards.include?(@random_card) do
            @random_card = Card.randomize
        end
        @entry.cards << @random_card
        redirect_to user_entry_path(@entry.user, @entry)
    end

    private

    def entry_params
    end

end