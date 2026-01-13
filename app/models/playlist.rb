class Playlist < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  has_many :playlist_tracks, dependent: :destroy
  has_many :tracks, through: :playlist_tracks

  validates :name, presence: true, allow_blank: false
end
