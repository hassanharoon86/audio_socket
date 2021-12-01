# frozen_string_literal: true

class CreateAuditions < ActiveRecord::Migration[6.1]
  def change
    create_table :auditions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :artist_name
      t.string :genre
      t.string :hear_about
      t.text :additional_info

      t.timestamps
    end
  end
end
