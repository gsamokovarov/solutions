class LoginController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(email: login_params["email"])
    if (@user.nil?)
      redirect_to login_index_path, notice: get_error_message
      return
    end
    
    if (@user.authenticate(login_params["password"]) == false)
      redirect_to login_index_path, notice: get_error_message
      return
    end

    login(@user)
    render :show
  end

  def show
    @user = current_user
  end

  def destroy
    cookies.delete(:user_id)
    render :index 
  end
  
  private

  def login_params
    params.require(:login).permit(:email, :password)
  end

  def get_error_message
    "Username or password is incorect"
  end
end
