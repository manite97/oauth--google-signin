class SessionsController < ApplicationController
  skip_before_action :current_user
  # skip_before_action :authenticity_token
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
    password = params[:password]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id #initializing the session
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
  	session[:user_id] = nil # removing the session
    redirect_to root_url, notice: "Logged out!"
  end
end

