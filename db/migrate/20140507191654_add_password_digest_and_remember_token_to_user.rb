class AddPasswordDigestAndRememberTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    remove_column :users, :password, :string
    remove_column :users, :password_confirmation, :string
  end
end
