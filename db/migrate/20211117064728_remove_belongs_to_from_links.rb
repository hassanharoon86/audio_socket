# frozen_string_literal: true

class RemoveBelongsToFromLinks < ActiveRecord::Migration[6.1]
  def change
    remove_index :links, :audition_id
    remove_column :links, :audition_id
  end
end
