# frozen_string_literal: true

# CreateTrack
class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
