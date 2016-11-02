class CommentsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @comment = Comment.new
  end
  def create
    @project = Project.find(params[:project_id])
    @comment = Comment.new(comment_params)
    @comment.project = @project
    @comment.user = current_user
    if @comment.save
      redirect_to @project
    else
      render :new
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end


private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
