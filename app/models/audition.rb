class Audition < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: [:first_name, :last_name, :artist_name, :email, :genres], using: :tsearch

  NAME_REGEX = /\A[a-zA-Z]+\z/.freeze
  GENRES = [
    'Acapella', 'Acid', 'Jazz', 'Acoustic', 'Acid Punk', 'Alternative',
    'Hip Hop', 'Ambient', 'Avantgarde', 'Bass', 'Blues', 'Cabaret', 'Celtic Chamber',
    'Chanson', 'Chorus', 'Christian Rap', 'Cinematic', 'Classical',
    'Classic Rock', 'Club', 'Comedy', 'Country', 'Cult'
  ].freeze
  SOURCES = ['Facebook', 'Instagram', 'Twitter', 'Other'].freeze

  enum status: [:pending, :accepted, :rejected, :deleted]

  has_many :links, dependent: :destroy
  belongs_to :user, optional: true

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: :true

  scope :approved, -> { where(status: :accepted) }

  validates :first_name, :last_name , length: { maximum: 30 },format: { with: NAME_REGEX, message: "No special characters allowed" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, :email, :artist_name, :links, :genres, :hear_about, presence: true
  validates :genres, inclusion: { in: GENRES, message: "Not a valid Ganre" }
  validates :hear_about, inclusion: { in: SOURCES, message: "Not a valid Source" }
  validates :first_name, :last_name , length: { maximum: 30 },format: { with: NAME_REGEX, message: "No special characters allowed" }
  validates :email, format: { with: Devise::email_regexp }
  validates :first_name, :last_name, :email, :artist_name, :links, :genres, :hear_about, presence: true

  before_validation :remove_empty_genre
  before_create :set_default_status

  private

  def remove_empty_genre
    genres.reject!(&:empty?)
  end

  def set_default_status
    self.status ||= :pending
  end
end
