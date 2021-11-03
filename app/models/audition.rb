class Audition < ApplicationRecord

  GENRES = ['Acapella', 'Acid', 'Jazz', 'Acoustic', 'Acid', 'Acid Punk', 'Alternative', 'Hip Hop', 'Ambient',
    'Avantgarde', 'Bass', 'Blues', 'Cabaret', 'Celtic Chamber', 'Chanson', 'Chorus', 'Christian Rap', 'Cinematic', 'Classical',
    'Classic Rock', 'Club', 'Comedy', 'Country', 'Cult' ]

  SOURCES = ['Facebook', 'Instagram', 'Twitter', 'Other']

  enum status: [:pending, :accepted, :rejected, :deleted]

  validates :first_name, :last_name , length: { maximum: 30 },format: { with: /\A[a-zA-Z]+\z/, message: "No special characters allowed" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, :email, :artist_name, :links, :genres, :hear_about, presence: true

  include PgSearch::Model
  pg_search_scope :search, against: [:first_name, :last_name, :artist_name, :email, :genres], using: :tsearch

  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: :true
  belongs_to :user, optional: true

  before_validation :remove_empty_genre
  before_create :set_default_status

  private

  def remove_empty_genre
    genres.reject! { |g| g.empty? }
  end

  def set_default_status
    self.status ||= :Pending
  end
end
