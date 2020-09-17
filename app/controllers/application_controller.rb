class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def authenticate_and_update_info(user)
        if user.authenticate(params[:user][:password])
            user.update(user_params)
            if params[:user][:new_password].present?
                user.password = params[:user][:new_password]
                user.save
            end
        else
            # message
        end
        redirect_to edit_user_path(user)
    end

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_authorization(user)
        unless user == current_user
            flash[:error] = "You do not have permission to view that page."
            redirect_to user_entries_path(current_user)
        end
    end

    def require_login
        unless logged_in?
            flash[:error] = "You must be logged in to view that page"
            redirect_to login_path 
        end
    end

end
