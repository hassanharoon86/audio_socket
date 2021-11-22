class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/

  enum role: [:artist, :manager]

  has_many :auditions, dependent: :nullify
  has_one :artist_detail, dependent: :destroy
  has_many :albums, dependent: :destroy

  validates :email, uniqueness: true
  validates :password, format: { with: PASSWORD_REGEX }
  validates :terms_of_service, acceptance: true

  before_create :set_default_role

  private

  def set_default_role
    self.role ||= :artist
  end
end
