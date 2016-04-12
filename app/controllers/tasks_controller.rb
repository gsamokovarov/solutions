class TasksController < ApplicationController 
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      flash[:error]= "Task was not created."
      render :new
    end
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task deleted successfully."
      render :index

    else
      flash[:error] = "Could not delete the task."
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :test, :test_command)
  end
end