class Trail < ApplicationRecord
  has_many :playlists, dependent: :destroy
end
