# frozen_string_literal: true

# AddManagerEmailToAudition
class AddManagerEmailToAuditions < ActiveRecord::Migration[5.2]
  def change
    add_column :auditions, :manager_email, :string
  end
end
