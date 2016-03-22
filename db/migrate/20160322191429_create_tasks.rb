class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :test, null: false
      t.text :test_command, null: false

      t.timestamps null: false
    end
  end
end
