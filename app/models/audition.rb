# frozen_string_literal: true

# class audtion
class Audition < ApplicationRecord
  # Association
  has_many :songs, inverse_of: :audition
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

  # Enums
  enum genre: %i[Acapella Acid Jazz Acoustic Acid_Punk Alternative Hip_Hop Ambient Avantgarde Bass Blues Cabaret
                 Celtic_Chamber Chanson Chorus Christian_Rap Cinematic Classical Classic_Rock Club Comedy Country Cult]

  # Validation
  validate do
    errors.add(:base, 'maximum four songs are allowed.') if songs.reject(&:marked_for_destruction?).length > 4
  end
end
