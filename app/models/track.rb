# frozen_string_literal: true

class Track < ApplicationRecord
  belongs_to :album
  has_one_attached :song

  enum status: %i[pending submitted ]
end
