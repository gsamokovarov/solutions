module UsersHelper
  def currrent_problems
    current_user.problems.where('ends_at >= ?', Date.today)
  end

  def past_solved_problems
    current_user.problems.where('ends_at < ?', Date.today)
  end
end