class AddStatusToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :status, :integer, default: 0
  end
end
