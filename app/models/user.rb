class User < ApplicationRecord
  before_create :set_default_role

  enum role: [:artist, :manager]

  PASSWORD_REGEX = /(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, format: { with: PASSWORD_REGEX }
  validates :role, presence: true
  validates :terms_of_service, acceptance: true

  private

  def set_default_role
    self.role ||= :artist
  end
end
