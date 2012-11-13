class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def sign_out

  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to @user, notice: 'User successfully created'
    else
      redirect_to users_path, notice: 'Failed to create new user'
    end
  end
end
