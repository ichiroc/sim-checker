class AddOauthColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ''
    add_column :users, :provider, :string, null: false, default: ''
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :token, :string, null: false, default: ''
    add_column :users, :meta, :string, null: false, default: ''
  end
end
