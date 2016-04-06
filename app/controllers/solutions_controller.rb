class SolutionsController < ApplicationController
  before_action :require_login

  def new
    @solution = problem.solutions.new
  end

  def show
    @solution = problem.solutions.find(params[:id])

    respond_to do |format|
      format.json { render json: @solution }
    end
  end

  def create
    @solution = problem.solutions.new(solution_params)
    if @solution.save
      CheckSolutionJob.perform_later(@solution)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def problem
    Problem.find(params[:problem_id])
  end

  def solution_params
    params.require(:solution).permit(:content)
  end
end
