class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :current_login_time
      t.datetime :last_login_time
      t.integer :login_count, :default => 0

      t.timestamps
    end
  end
end
