class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # if @user != User.find(session[:user_id])
    #   redirect_to users_path
    # end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to directory_path
    else
      render :new
    end
  end

  def  edit
    if @user != User.find(session[:user_id])
    redirect_to users_path
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, skill_ids: [])
  end
  def set_user
    @user = User.find(params[:id])
  end
end
