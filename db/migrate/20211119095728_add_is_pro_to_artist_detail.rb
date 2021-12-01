# frozen_string_literal: true

class AddIsProToArtistDetail < ActiveRecord::Migration[6.1]
  def change
    add_column :artist_details, :is_pro, :boolean, default: false
  end
end
