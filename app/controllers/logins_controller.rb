# app/controllers/logins_controller.rb
class LoginsController < ApplicationController
    skip_before_action :current_user

    def new
    end
  
    def create
      if user = authenticate_with_google
        session[:user_id] = user.id
        redirect_to root_url, notice: "Logged in!"
      else
        redirect_to root_url, alert: 'authentication_failed'
      end
    end

    def googleAuth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        user = User.from_omniauth(access_token)
        log_in(user)
        # Access_token is used to authenticate request made from the rails application to the google server
        user.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        user.google_refresh_token = refresh_token if refresh_token.present?
        user.save
        redirect_to root_path
      end
  
    private
      def authenticate_with_google
        if id_token = flash[:google_sign_in]["id_token"]
          user = User.find_by google_id: GoogleSignIn::Identity.new(id_token).user_id
          unless user
            user  = User.create!(:email => GoogleSignIn::Identity.new(id_token).email_address, :google_id => GoogleSignIn::Identity.new(id_token).user_id, :password => "mani334" )
          end
          user
        elsif error = flash[:google_sign_in][:error]
          logger.error "Google authentication error: #{error}"
          nil
        end
      end
  end