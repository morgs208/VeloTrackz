class CreateTracks < ActiveRecord::Migration[8.1]
  def change
    create_table :tracks do |t|
      t.string :spotify_id
      t.string :name
      t.string :artist
      t.string :album_art_url

      t.timestamps
      t.index :spotify_id, unique: true
    end
  end
end
