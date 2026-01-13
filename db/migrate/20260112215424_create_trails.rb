class CreateTrails < ActiveRecord::Migration[8.1]
  def change
    create_table :trails do |t|
      t.string :name
      t.text :description
      t.string :osm_id
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
