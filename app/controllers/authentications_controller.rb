class AuthenticationsController < ApplicationController
  def index
    if current_user
      @auths = current_user.authentications.all
    end
  end

  def create
    omniauth = request.env["omniauth.auth"]
    auth = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if auth
      session[:user_id] = auth.user_id
      user = User.find(auth.user_id)
      user.update_from_omniauth(omniauth)
      user.last_login_time = user.current_login_time
      user.current_login_time = Time.now()
      user.login_count += 1
      user.save!
      if !omniauth.credentials.token.nil?
        auth.oauth_token = omniauth.credentials.token
        auth.oauth_expires = Time.at(omniauth.credentials.expires_at)
        auth.save!
      end
      flash[:notice] = "You have logged in."
      redirect_to root_url
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
    else
      u = User.new()
      u.update_from_omniauth(omniauth)
      u.current_login_time = Time.now()
      u.login_count = 1
      if u.save
        auth = u.authentications.new(:provider => omniauth['provider'], :uid => omniauth['uid'])
        if !omniauth.credentials.token.nil?
          auth.oauth_token = omniauth.credentials.token
          auth.oauth_expires = Time.at(omniauth.credentials.expires_at)
        end
        if auth.save
          UserMailer.signup_confirmation(u).deliver
          session[:user_id] = u.id
        end
      else
        flash[:notice] = "An account already exists. Please log in first."
      end
      redirect_to root_url
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end
end
