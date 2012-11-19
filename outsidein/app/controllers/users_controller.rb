class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    if can? :update, user 
      user.destroy

      flash[:message] = 'User successfully deleted'
    else 
      flash[:message] = 'You do not have permission to delete this user'
    end
    redirect_to :root
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])

    flash[:message] = 'User successfully updated'
    redirect_to @user 
  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      @enablePassword = true
    else
      flash[:message] = 'You do not have permission to view this page'
      redirect_to :users
    end
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:message] = 'User successfully created'
      redirect_to @user
    else
      flash[:message] = 'Failed to create new user'
      render action: "new"
    end
  end
end
