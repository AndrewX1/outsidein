class PasswordResetsController < ApplicationController
  def create
    user = User.find_by_username(params[:username])
    user.send_password_reset if user
    flash[:message] = "Email sent with password reset instructions."
    redirect_to :users
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:message] = "Password reset has expired."
      redirect_to new_password_reset_path
    elsif @user.update_attributes(params[:user])
      flash[:message] = "Password has been reset!"
      redirect_to :users
    else
      render :edit
    end
  end

end
