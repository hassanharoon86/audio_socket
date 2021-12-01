# frozen_string_literal: true

class RemoveAssignedToFromAuditions < ActiveRecord::Migration[6.1]
  def change
    remove_column :auditions, :assigned_to, :string
  end
end
