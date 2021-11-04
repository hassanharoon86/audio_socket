class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/

  enum role: [:artist, :manager]

  validates :password, format: { with: PASSWORD_REGEX }
  validates :role, presence: true
  validates :terms_of_service, acceptance: true

  before_create :set_default_role

  private

  def set_default_role
    self.role ||= :artist
  end
end
