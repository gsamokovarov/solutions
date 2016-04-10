class UsersController < ApplicationController
  
  def index
    redirect_to user_path(current_user_id) and return unless current_user_id == 0
  end

  def new
    @user = User.new
  end
  
  def create
    if (params.has_key?("login"))
      check_user_credentials
    else
      create_new_user
    end
  end

  def show
    require_login and return if current_user_id == 0
    @user = User.find(params[:id])
  end
  
  def destroy
    cookies.delete(:user_id) if current_user_id == params[:id].to_i
    render :index   
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def login_params
    params.require(:login).permit(:email, :password)
  end

  def create_new_user
    @user = User.new(user_params)
    if @user.save
      login(@user)
      UserMailer.welcome_mail(@user).deliver_later
      redirect_to @user, notice: "You officially have problems, now"
    else
      render :new
    end
  end

  def check_user_credentials
    @user = User.find_by(email: login_params["email"])    
    redirect_to_user_path and return unless @user
    
    @user = @user.authenticate(login_params["password"])
    redirect_to_user_path and return unless @user

    login(@user)
    render :show
  end

  def redirect_to_user_path
    redirect_to users_path, notice: "User name or password is incorrect"
  end
end
