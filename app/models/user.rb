# frozen_string_literal: true

class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/.freeze

  enum role: %i[artist manager]

  has_many :auditions, dependent: :nullify
  has_one :artist_detail, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums

  validates :email, uniqueness: true
  validates :password, format: { with: PASSWORD_REGEX }
  validates :terms_of_service, acceptance: true

  before_create :set_default_role

  def username
    email.split('@').first
  end

  private

  def set_default_role
    self.role ||= :artist
  end
end
