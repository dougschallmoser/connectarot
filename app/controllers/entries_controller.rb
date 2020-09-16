class EntriesController < ApplicationController

    before_action :set_entry, only: [:show, :update, :destroy]

    def index
        @user = User.find_by(id: params[:user_id])
        @user_entries = @user.entries.order(created_at: :desc)
        @monthly_entries = @user_entries.this_month
        @total_cards = @monthly_entries.size * 3
        # @duplicate_cards_hash = @user.cards.this_month.select_duplicates
        @duplicate_cards_hash = @user.cards.select_duplicates
    end

    def show
        @thoughts = @entry.thoughts.order(created_at: :desc)
    end

    def new
        @user = User.find_by(id: params[:user_id])
        @entry = @user.entries.build
        @category = @entry.build_category
    end

    def create
        if params[:entry_id].present?
            @entry = Entry.find_by(id: params[:entry_id])
        else
            @user = User.find_by(id: params[:user_id])
            @entry = @user.entries.create(entry_params)
        end
        @entry.add_randomized_card
        redirect_to entry_path(@entry)
    end

    def destroy
        @entry.destroy
        redirect_to user_entries_path(current_user)
    end

    private

    def set_entry
        @entry = Entry.find_by(id: params[:id])
    end

    def entry_params
        params.require(:entry).permit(:category_id, :title, category_attributes: [:name, :question_1, :question_2, :question_3])
    end

end