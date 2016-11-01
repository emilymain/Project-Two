class ProjectsController < ApplicationController
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
    @project = Project.find(params[:id])
    @creator = User.find(@project.creator).name
  end

  private
    def project_params
      params.require(:project).permit(:title, :content, :funding, skill_ids: [])
    end

end
