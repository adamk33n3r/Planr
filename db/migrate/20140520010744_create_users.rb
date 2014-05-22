class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, :null => false, :default => ""
      t.string :provider
      t.string :uid
      t.integer :sign_in_count, :default => 0, :null => false
      t.datetime :last_sign_in_at
      t.string :last_sign_in_ip

      t.timestamps
    end
    add_index :users, :email,                :unique => true
  end
end
