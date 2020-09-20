class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash
      user = User.find_or_create_by_omniauth(auth_hash)
      if user.email
        session[:user_id] = user.id
        flash[:message] = "You have successfully logged in"
        redirect_to user_entries_path(user)
      else
        flash[:error] = "Email is is blank. Please try again"
        redirect_to login_path
      end
    else 
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        flash[:message] = "You have successfully logged in"
        redirect_to user_entries_path(@user)
      else
        flash[:error] = "Invalid credentials. Please try again"
        redirect_to login_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end