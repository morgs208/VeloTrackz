class CreatePlaylists < ActiveRecord::Migration[8.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :trail, null: false, foreign_key: true

      t.timestamps
      t.index [:trail_id, :user_id]
    end
  end
end
