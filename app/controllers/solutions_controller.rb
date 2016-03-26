class SolutionsController < ApplicationController
  before_action :require_login

  def new
    @solution = Solution.new
  end

  def show
    @solution = Solution.find(params[:id])
  end
end
