class DashboardsController < ApplicationController
  before_action :require_login

  def index
    @solved_problems = current_user.solved_problems
    @unsolved_problems = current_user.unsolved_problems
  end
end
