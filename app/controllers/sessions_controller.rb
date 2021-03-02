class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    p user
    respond_to do |format|
      if user&& user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        format.html { redirect_to root_path, notice: "Welcome #{user.fullname}!!"}
        format.js
      else 
        format.html { redirect_to new_session_path, alert: "Incorrect Login Credentials!"}
        format.js
      end
    end
  end

  def destroy 
    respond_to do |format|
      session.delete(:user_id)
      current_user = nil
      format.html { redirect_to root_path, notice: "Do visit again!!"}
    end
  end


end
