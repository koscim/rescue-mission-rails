class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to '/questions'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/questions'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
