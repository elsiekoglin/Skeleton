class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :hashed_password, null: false

      t.timestamp(null: false)
    end
  end
end
