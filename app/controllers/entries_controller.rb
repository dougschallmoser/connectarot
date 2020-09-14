class EntriesController < ApplicationController

    before_action :set_user, only: [:show, :new]
    before_action :set_entry, only: [:show, :update, :destroy]

    def show
        @thought = @entry.thoughts.build
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

    def update
        if @entry.update(entry_params)
            redirect_to user_entry_path(@entry.user, @entry)
        else
            raise "didn't work".inspect
        end
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
        params.require(:entry).permit(:user_id, :category_id, thoughts_attributes: [:content])
    end

end

# <%= form_for([@user, @entry]) do |f| %>
#     <%= f.fields_for :thoughts do |t| %>
#         <%= t.label :content, "Add a thought: " %>
#       <p>
#         <%= t.text_area :content, value: "", size: "50%" %>
#       </p>
#     <% end %>
#     <%= f.submit "Add" %>
#   <% end %>