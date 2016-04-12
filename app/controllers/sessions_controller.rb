class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user and @user.authenticate(params[:user][:password_digest])
      login(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    logout
    render :new
  end
end