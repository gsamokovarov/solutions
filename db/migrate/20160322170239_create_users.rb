class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :failed_attempts, null: false, default: 0
      t.boolean :is_admin, null: false, default: false

      t.timestamps null: false
    end
  end
end
