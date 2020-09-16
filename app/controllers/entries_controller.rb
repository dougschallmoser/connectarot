class EntriesController < ApplicationController

    before_action :set_entry, only: [:show, :update, :destroy]
    before_action :require_login

    def index
        @user = User.find_by(id: params[:user_id])
        @all_user_entries = @user.entries.order(created_at: :desc)
        if params[:entry].present?
            @user_entries = @all_user_entries.filter_by_spread(params[:entry][:category_name])
        else
            @user_entries = @all_user_entries 
        end    
        @monthly_entries = @all_user_entries.this_month
        @total_cards = @monthly_entries.size * 3
        @duplicate_cards_hash = @user.cards.select_duplicates
        # @duplicate_cards_hash = @user.cards.this_month.select_duplicates
    end

    def show
        @thoughts = @entry.thoughts.order(created_at: :desc)
    end

    def new
        @user = User.find_by(id: params[:user_id])
        @entry = @user.entries.build
        @category = @entry.build_category
        # @anything = Category.all.limit(5)
    end

    def create
        if params[:entry_id].present?
            @entry = Entry.find_by(id: params[:entry_id])
        else
            @user = User.find_by(id: params[:user_id])
            @entry = @user.entries.create(entry_params)
        end
        if @entry.valid?
            @entry.add_randomized_card
            redirect_to entry_path(@entry)
        else
            @category = @entry.build_category
            render :new 
        end
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
        params.require(:entry).permit(:category_id, :category_name, :title, category_attributes: [:question_1, :question_2, :question_3])
    end

end