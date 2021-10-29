class Audition < ApplicationRecord
  GENRES = ['Acapella', 'Acid', 'Jazz', 'Acoustic', 'Acid', 'Acid Punk', 'Alternative', 'Hip Hop', 'Ambient',
    'Avantgarde', 'Bass', 'Blues', 'Cabaret', 'Celtic Chamber', 'Chanson', 'Chorus', 'Christian Rap', 'Cinematic', 'Classical',
    'Classic Rock', 'Club', 'Comedy', 'Country', 'Cult' ]

  SOURCES = ['Facebook', 'Instagram', 'Twitter', 'Other']

  validates :first_name, presence: true ,length: { maximum: 30 },format: { with: /\A[a-zA-Z]+\z/, message: "No special characters allowed" }
  validates :last_name, presence: true ,length: { maximum: 30 },format: { with: /\A[a-zA-Z]+\z/, message: "No special characters allowed" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :artist_name, presence: true
  validates :genres, presence: true

  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: :true
end
