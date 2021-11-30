# frozen_string_literal: true

class RemoveGenreFromAuditions < ActiveRecord::Migration[6.1]
  def change
    remove_column :auditions, :genre, :string
  end
end
