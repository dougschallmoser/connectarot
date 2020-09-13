class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
        @entries = @user.entries
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
        if @user && @user.id == session[:user_id]
            self.authenticate_and_update_info(@user)
        else
            redirect_to user_path(@user)
        end
    end

    def destroy
        @user.destroy 
        redirect_to root_path
    end

    private

    def set_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end