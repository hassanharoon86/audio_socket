class ArtistDetail < ApplicationRecord
  belongs_to :user, -> { where role: :manager }
  has_one_attached :image
end
