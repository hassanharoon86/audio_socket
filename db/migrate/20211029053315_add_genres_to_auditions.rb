# frozen_string_literal: true

class AddGenresToAuditions < ActiveRecord::Migration[6.1]
  def change
    add_column :auditions, :genres, :string, array: true
  end
end
