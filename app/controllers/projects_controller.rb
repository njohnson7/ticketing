class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id]
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
  end

  def destroy
  end

  private
    def params__

    end
end
