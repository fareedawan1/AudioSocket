# frozen_string_literal: true

# AddColumnToUser
class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
    add_column :users, :bio, :text
    add_column :users, :website_link, :string
    add_column :users, :social_link, :string, array: true, default: []
  end
end
