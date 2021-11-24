class Album < ApplicationRecord
  belongs_to :user, -> { where role: :artist }
  has_one_attached :artwork
  has_many :tracks

  default_scope { order(:id) }

  validates :title, presence: true
  validates :artwork, content_type: [:png, :jpg, :jpeg], dimension: { min: 353..353 }
end
