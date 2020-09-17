class EntriesController < ApplicationController

    before_action :set_entry, only: [:show, :update, :destroy]
    before_action :set_user, only: [:index, :new, :create]
    before_action :require_login
    before_action except: [:show, :create, :destroy] do 
        require_authorization(@user)
    end
    # before_action only: :show do
    #     require_authorization(@entry.user)
    # end

    def index
        @all_user_entries = @user.entries.order(created_at: :desc)
        if params[:spread].present?
            @user_entries = @all_user_entries.filter_by_spread(params[:spread][:category_name])
        elsif params[:card].present?
            @user_entries = @all_user_entries.filter_by_card(params[:card][:card_id])
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
        @entry = @user.entries.build
        @category = @entry.build_category
        # @anything = Category.all.limit(5)
    end

    def create
        if params[:entry_id].present?
            @entry = Entry.find_by(id: params[:entry_id])
        else
            @entry = @user.entries.create(entry_params)
        end
        if @entry.valid?
            @entry.add_randomized_card unless params[:entry] && params[:entry][:card_ids]
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

    def set_user
        @user = User.find_by(id: params[:user_id])
    end

    def entry_params
        params.require(:entry).permit(:category_id, :title, { card_ids: [] }, :interpretation, category_attributes: [:question_1, :question_2, :question_3])
    end

end

# <p>
# <%= f.label :card_ids, "Select card:" %><br>
# <%= f.collection_select :card_ids, Card.all, :id,  :name, {include_blank: true}, {:name => "entry[card_ids][]"} %>
# </p>
# <p>
# <%= f.label :card_ids, "Select card:" %><br>
# <%= f.collection_select :card_ids, Card.all, :id, :name, {include_blank: true}, {name: "entry[card_ids][]"} %>
# </p>
# <p>
# <%= f.label :card_ids, "Select card:" %><br>
# <%= f.collection_select :card_ids, Card.all, :id, :name, {include_blank: true}, {name: "entry[card_ids][]"} %>
# </p>