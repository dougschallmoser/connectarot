class EntriesController < ApplicationController

    def new
        @user = User.find_by(id: params[:user_id])
        @entry = @user.entries.build
    end

    def create
    end

end