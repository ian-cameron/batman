class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    @project.client = current_client
    if @project.save
      redirect_to root_url, :notice => "Added new project!"
    else
      render "new"
    end
  end
  
  def index
    @projects = Project.all
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to root_url, notice: "project updated successfully" 
    else
      render 'edit'
    end
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :start_date, :end_date)
  end
end