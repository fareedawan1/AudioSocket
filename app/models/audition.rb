# frozen_string_literal: true

# class audtion
class Audition < ApplicationRecord
  # Enums
  enum genre: %i[Acapella Acid Jazz Acoustic Acid_Punk Alternative Hip_Hop Ambient Avantgarde Bass Blues Cabaret
                 Celtic_Chamber Chanson Chorus Christian_Rap Cinematic Classical Classic_Rock Club Comedy Country Cult]
end
