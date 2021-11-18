class ArtistDetail < ApplicationRecord
  belongs_to :user, -> { where role: :artist }
  has_one_attached :image
  has_many :links, as: :linkable, dependent: :destroy

  validates :email, format: { with: Devise::email_regexp }
  validates :email, :artist_name, :links, :country_code, :bio, :website_link, presence: true

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: :true
end
