class PlaylistTrack < ApplicationRecord
  belongs_to :playlist
  belongs_to :track

  # Add this line for automatic position management
  default_scope { order(position: :asc) }
end
