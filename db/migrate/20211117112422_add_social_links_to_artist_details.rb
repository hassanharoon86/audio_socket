class AddSocialLinksToArtistDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :artist_details, :social_links, :string, array: true
  end
end
