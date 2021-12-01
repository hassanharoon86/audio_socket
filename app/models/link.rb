# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :linkable, polymorphic: true
end
