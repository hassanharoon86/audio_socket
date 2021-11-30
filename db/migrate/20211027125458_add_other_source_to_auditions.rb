# frozen_string_literal: true

class AddOtherSourceToAuditions < ActiveRecord::Migration[6.1]
  def change
    add_column :auditions, :other_source, :string
  end
end
