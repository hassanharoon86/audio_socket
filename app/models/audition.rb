class Audition < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: [:first_name, :last_name, :artist_name, :email, :genres], using: :tsearch

#   AUDITION_ACCEPT_EMAIL = 'Thanks for submitting music to Audiosocket, we have listened to your link and would love to work with you!

# Please sign in to our artist portal here. There, you can update your artist profile, submit music, artworks, etc. The more assets you can give us the better. Once submitted, our team will review and will start the ingestion into our catalog.

# Thanks!
# Music Licensing Coordinator'.freeze
#   AUDITION_REJECT_EMAIL = 'Thank you for submitting an audition. After careful review, we’ve decided the music you submitted is not a match for our current needs. Please understand, that while your music may not be a match this time, it certainly might be in the future as our clients’ needs are constantly changing.

# With that in mind, we encourage you to submit new music again in the future.

# Have a great day!'.freeze
  NAME_REGEX = /\A[a-zA-Z]+\z/.freeze
  GENRES = [
    'Acapella', 'Acid', 'Jazz', 'Acoustic', 'Acid Punk', 'Alternative',
    'Hip Hop', 'Ambient', 'Avantgarde', 'Bass', 'Blues', 'Cabaret', 'Celtic Chamber',
    'Chanson', 'Chorus', 'Christian Rap', 'Cinematic', 'Classical',
    'Classic Rock', 'Club', 'Comedy', 'Country', 'Cult'
  ].freeze
  SOURCES = ['Facebook', 'Instagram', 'Twitter', 'Other'].freeze

  enum status: [:pending, :accepted, :rejected, :deleted], _default: :pending

  has_many :links, dependent: :destroy
  belongs_to :user, optional: true

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: :true

  validates :first_name, :last_name , length: { maximum: 30 }, format: { with: NAME_REGEX, message: "No special characters allowed" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, :email, :artist_name, :links, :genres, :hear_about, presence: true
  validates :genres, inclusion: { in: GENRES, message: "Not a valid Ganre" }
  validates :hear_about, inclusion: { in: SOURCES, message: "Not a valid Source" }
  validates :first_name, :last_name , length: { maximum: 30 }, format: { with: NAME_REGEX, message: "No special characters allowed" }
  validates :email, format: { with: Devise::email_regexp }
  validates :first_name, :last_name, :email, :artist_name, :links, :genres, :hear_about, presence: true

  before_validation :remove_empty_genre

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.attributes
    %w{id first_name last_name artist_name email genres created_at assigned_to status}
  end

  private

  def remove_empty_genre
    genres.reject!(&:empty?)
  end
end
