class ProjectsController < ApplicationController
  before_action :set_project, :only => [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    @project.creator = session[:user_id]
    if @project.save
      User.find(session[:user_id]).projects << @project
      redirect_to @project
    else
      render :new
    end
  end

  def new
    @project = Project.new
  end

  def show
    @creator = User.find(@project.creator)
    @comment = Comment.new
  end
  def destroy
    @project.destroy
    redirect_to directory_path
  end


  private
    def project_params
      params.require(:project).permit(:title, :content, :funding, skill_ids: [])
    end
    def set_project
      @project = Project.find(params[:id])
    end
end
