class User < ApplicationRecord
  enum role: [:artist, :manager]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :password, format: { with: /(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/}
  validates :role, presence: true
  validates :terms_of_service, acceptance: true
end
