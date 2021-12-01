# frozen_string_literal: true

class AddAssignedToToAuditions < ActiveRecord::Migration[6.1]
  def change
    add_column :auditions, :assigned_to, :string
  end
end
