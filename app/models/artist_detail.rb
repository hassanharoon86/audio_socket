class ArtistDetail < ApplicationRecord
  belongs_to :user, -> { where role: :artist }
  has_one_attached :image
  has_many :links, as: :linkable, dependent: :destroy

  validates :email, format: { with: Devise::email_regexp }
  validates :email, :country_code, presence: true
  validates :image, attached: true, content_type: [:png, :jpg, :jpeg], dimension: { min: 353..353 }

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: :true
end
