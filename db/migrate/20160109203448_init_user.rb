class InitUser < ActiveRecord::Migration
  def change
    remove_column :users, :email
    remove_column :users, :encrypted_password
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :name
  end
end
