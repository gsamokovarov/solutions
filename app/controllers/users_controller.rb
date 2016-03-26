class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      UserMailer.welcome_mail(@user).deliver_later
      redirect_to @user, notice: "You officially have problems, now"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
