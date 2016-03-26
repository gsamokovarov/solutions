class ProblemsController < ApplicationController
  before_action :require_login

  def index
    @problems = current_user.current_problems
  end
end
