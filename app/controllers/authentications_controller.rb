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
      flash[:notice] = "You have logged in."
      redirect_to root_url
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
    else
      u = User.create(:email => omniauth['info']['email'])
      if u.save
        u.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
        session[:user_id] = u.id
      else
        flash[:notice] = "An account with your email address already exists. Please log in first."
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
