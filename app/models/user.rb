class User < ApplicationRecord
  enum role: [:artist, :manager]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/ }
  validates :role, presence: true
  validates :terms_of_service, acceptance: true

  def set_default_role
    self.role ||= :manager
  end
end
