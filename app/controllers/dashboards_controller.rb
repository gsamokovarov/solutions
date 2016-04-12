class DashboardsController < ApplicationController
  before_action :require_login

  def index
    @current_problems = current_user.current_problems
    @new_problems = current_user.new_problems
  end
end
