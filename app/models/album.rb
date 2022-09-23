# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :user
  has_many :tracks, dependent: :destroy

  has_one_attached :image
end
