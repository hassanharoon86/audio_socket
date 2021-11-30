# frozen_string_literal: true

class Track < ApplicationRecord
  belongs_to :album
  has_one_attached :track

  validates :title, presence: true
  validates :track, attached: true, content_type: %i[mp3 wav]
end
