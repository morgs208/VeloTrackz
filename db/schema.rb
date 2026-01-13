# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_12_215728) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "playlist_tracks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "playlist_id", null: false
    t.integer "position"
    t.bigint "track_id", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id", "position"], name: "index_playlist_tracks_on_playlist_id_and_position"
    t.index ["playlist_id"], name: "index_playlist_tracks_on_playlist_id"
    t.index ["track_id"], name: "index_playlist_tracks_on_track_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "trail_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["trail_id", "user_id"], name: "index_playlists_on_trail_id_and_user_id"
    t.index ["trail_id"], name: "index_playlists_on_trail_id"
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "album_art_url"
    t.string "artist"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "spotify_id"
    t.datetime "updated_at", null: false
    t.index ["spotify_id"], name: "index_tracks_on_spotify_id", unique: true
  end

  create_table "trails", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "name"
    t.string "osm_id"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "playlist_tracks", "playlists"
  add_foreign_key "playlist_tracks", "tracks"
  add_foreign_key "playlists", "trails"
  add_foreign_key "playlists", "users"
  add_foreign_key "sessions", "users"
end
