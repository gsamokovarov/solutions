class TasksController < ApplicationController
  before_action :require_login

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render :show
    else
      redirect_to new_task_path, notice: "#{@task.errors.full_messages}"
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :test_command, :test)
  end
end
