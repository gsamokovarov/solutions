class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login(user)
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
     @current_user ||= User.find_by(id: cookies.permanent.signed[:user_id])
  end
  
  private

  def current_user_id
    user_id = cookies.permanent.signed[:user_id]
    user_id ||= 0
  end

  
  def require_login
    redirect_to users_path if current_user.nil?
  end
end
