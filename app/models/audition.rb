class Audition < ApplicationRecord

  NAME_REGEX = /\A[a-zA-Z]+\z/

  GENRES = ['Acapella', 'Acid', 'Jazz', 'Acoustic', 'Acid', 'Acid Punk', 'Alternative', 'Hip Hop', 'Ambient',
    'Avantgarde', 'Bass', 'Blues', 'Cabaret', 'Celtic Chamber', 'Chanson', 'Chorus', 'Christian Rap', 'Cinematic', 'Classical',
    'Classic Rock', 'Club', 'Comedy', 'Country', 'Cult' ]

  SOURCES = ['Facebook', 'Instagram', 'Twitter', 'Other']

  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: :true

  validates :first_name, :last_name , length: { maximum: 30 },format: { with: NAME_REGEX, message: "No special characters allowed" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, :email, :artist_name, :links, :genres, :hear_about, presence: true

  before_validation :remove_empty_genre

  private

  def remove_empty_genre
    genres.reject! { |g| g.empty? }
  end
end
