class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new params.require(:project).permit(:name, :description)
    if @project.save
      flash[:success] = 'Project was successfully created.'
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update params.require(:project).permit(:name, :description)
      flash[:success] = 'Project was successfully updated.'
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:success] = 'Project was successfully deleted.'
    redirect_to projects_path
  end

  private
    def find_project
      @project = Project.find params[:id]
    end
end
