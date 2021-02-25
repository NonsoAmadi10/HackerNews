class ApplicationController < ActionController::Base

    include SessionsHelper

    helper_method :current_user
    helper_method :logged_in?

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
       
        !current_user.nil?
    end
    

        private
        def logged_in_user
            unless logged_in?
            store_location
            flash[:alert] = "Please log in."
            redirect_to new_session_path
        end
    end

end
