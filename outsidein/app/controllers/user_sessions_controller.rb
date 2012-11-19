class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      flash[:message] = "Logged in successfully as #{@user.username}."
      redirect_back_or_to @user
    else
      flash[:message] = 'Login failed'
      render :action => :new
    end
  end

  def destroy
    logout
    flash[:message] = 'Logged out.'
    redirect_to :root
  end
end
