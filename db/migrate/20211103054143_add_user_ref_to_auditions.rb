class AddUserRefToAuditions < ActiveRecord::Migration[6.1]
  def change
    add_reference :auditions, :user, foreign_key: true
  end
end
