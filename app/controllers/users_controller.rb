class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :require_authorization, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:message] = "Account successfully created. You are now logged in."
      redirect_to user_entries_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user && @user.id == session[:user_id]
      authenticate_and_update_info(@user)
    else
      redirect_to user_entries_path(@user)
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def authenticate_and_update_info(user)
    if user.authenticate(params[:user][:password])
      user.update(user_params)
      if params[:user][:new_password].present?
        user.password = params[:user][:new_password]
        user.save
      end
      flash[:message] = "Changes saved"
    else
        flash[:message] = "Invalid credentials. Please try again."
    end
    redirect_to edit_user_path(user)
  end
end