# frozen_string_literal: true

# links.rb
class Links < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :link
      t.belongs_to :audition, foreign_key: true

      t.timestamps
    end
  end
end
