class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user

  protect_from_forgery with: :exception

  def login(user)
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.permanent.signed[:user_id])
    #@current_user ||= User.find_by(email: 'to@example.org')
  end

  def logout
    cookies.delete :user_id
    current_user = nil
  end

  private

  def require_login
    redirect_to new_user_path if current_user.nil?
  end
end
