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
    @projects = Project.by_client(current_client)
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
  
  def destroy
    @project=Project.find(params[:id])
    if @project.destroy
      redirect_to root_path, notice: "Project Deleted!"
    else
      redirect_to :back
    end
  end
  
  def archive
    @project=Project.find(params[:id])
    if @project.update_attributes(archived: true)
      @project.deployments.each do |d|
        d.update_attributes(end_date: Time.now)
      end
      redirect_to root_path, notice: "Project Archived!"
    else
      redirect_to :back
    end
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :start_date, :end_date)
  end
end