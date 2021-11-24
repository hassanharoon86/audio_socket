class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :title
      t.boolean :is_submitted, default: false
      t.belongs_to :album

      t.timestamps
    end
  end
end
