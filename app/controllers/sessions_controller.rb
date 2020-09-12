class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user 
            
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end