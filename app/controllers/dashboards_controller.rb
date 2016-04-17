class DashboardsController < ApplicationController
  before_action :require_login

  def index
    @solved_problems = current_auth.solved_problems
    @unsolved_problems = current_auth.unsolved_problems
  end
end

