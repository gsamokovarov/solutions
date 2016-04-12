class DashboardsController < ApplicationController
  def index
    @problems_current = current_user.current_problems
    @past_solved_problems = current_user.past_solved_problems
  end
end