# frozen_string_literal: true

# CreateSong
class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :link
      t.belongs_to :audition, foreign_key: true

      t.timestamps
    end
  end
end
