class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]

    def show
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end

    def edit
    end

    def update
    end

    private

    def set_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end