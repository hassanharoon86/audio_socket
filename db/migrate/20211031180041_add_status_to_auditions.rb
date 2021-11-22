class AddStatusToAuditions < ActiveRecord::Migration[6.1]
  def change
    add_column :auditions, :status, :integer
  end
end
