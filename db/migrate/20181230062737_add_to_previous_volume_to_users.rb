class AddToPreviousVolumeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :previous_volume, :integer, default: 0, null: false
    add_column :users, :previous_volume_updated_at, :datetime
  end
end
