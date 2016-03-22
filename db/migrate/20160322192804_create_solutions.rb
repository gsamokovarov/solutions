class CreateSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :solutions do |t|
      t.belongs_to :problem, foreign_key: true, null: false
      t.text :content, null: false
      t.text :test_output, null: false
      t.integer :test_status, null: false
      t.datetime :checked_at, null: false

      t.timestamps null: false
    end
  end
end
