class UsersController < ApplicationController
  before_action :authenticate_admin
  def index
    @users = User.all.where(admin: false)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_update_params)
      redirect_to users_path
      flash.now[:success] = "Edited User!"
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
      flash.now[:success] = "New User!"
    else
      render 'new'
    end
  end

  private

  def authenticate_admin
    unless current_user.try(:admin?)
      redirect_to root_url
      flash[:error] = "You are not logged in as an administrator."
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:email)
  end
end
