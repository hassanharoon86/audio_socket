class AddPolymorphicColumnsToLinks < ActiveRecord::Migration[6.1]
  def change
    add_reference :links, :linkable, polymorphic: true
  end
end
