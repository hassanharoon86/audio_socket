class Track < ApplicationRecord
  belongs_to :album
  has_one_attached :track#, content_type: [:mp3, :wav]

  validates :title, presence: true
  validates :track, attached: true
end
