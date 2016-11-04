class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
    render layout: "navbar"
  end

  def show
    render layout: "navbar"
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
  def destroy
    Project.all.each do |project|
      if project.creator == @user.id
        project.destroy
      end
    end
    @user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_file_size, :image_file_name, :image_content_type, :image_updated_at, skill_ids: [])
  end
  def set_user
    @user = User.find(params[:id])
  end
end
