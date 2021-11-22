class Album < ApplicationRecord
  belongs_to :User, -> { where role: :artist }
end
