class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def sign_out

  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])

    redirect_to @user, notice: 'User successfully updated'
  end

  def edit
    @user = User.find(params[:id])
    @enablePassword = true
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to @user, notice: 'User successfully created'
    else
      render action: "new", notice: 'Failed to create new user'
    end
  end
end
