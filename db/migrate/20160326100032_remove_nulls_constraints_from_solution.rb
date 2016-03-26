class RemoveNullsConstraintsFromSolution < ActiveRecord::Migration[5.0]
  def change
    change_column_null :solutions, :test_output, from: false, to: true
    change_column_null :solutions, :test_status, from: false, to: true
    change_column_null :solutions, :checked_at, from: false, to: true
  end
end
