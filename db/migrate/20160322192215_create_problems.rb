class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :task, foreign_key: true, null: false
      t.datetime :ends_at, null: false

      t.timestamps null: false
    end
  end
end
