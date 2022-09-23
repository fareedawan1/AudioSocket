# frozen_string_literal: true

# addingRefToAudition
class AddingRefsInAudition < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :role, :int
    add_column :users, :type, :string
    add_column :auditions, :artist_id, :bigint
    add_column :auditions, :manager_id, :bigint
    remove_column :auditions, :user_id, :bigint
  end
end
