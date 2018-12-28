class AddIijmioTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :iijmio_token, :string
    add_column :users, :iijmio_token_created_at, :datetime
  end
end
