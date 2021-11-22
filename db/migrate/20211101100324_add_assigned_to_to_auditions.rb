class AddAssignedToToAuditions < ActiveRecord::Migration[6.1]
  def change
    add_column :auditions, :assigned_to, :string
  end
end
