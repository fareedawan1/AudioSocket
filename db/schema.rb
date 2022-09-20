# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_920_123_702) do # rubocop:disable Metrics/BlockLength
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'albums', force: :cascade do |t|
    t.string 'name'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_albums_on_user_id'
  end

  create_table 'auditions', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'artist_name'
    t.integer 'genre'
    t.string 'hear_about_us'
    t.text 'additional_info'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'status', default: 0
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_auditions_on_user_id'
  end

  create_table 'ckeditor_assets', force: :cascade do |t|
    t.string 'data_file_name', null: false
    t.string 'data_content_type'
    t.integer 'data_file_size'
    t.string 'data_fingerprint'
    t.string 'type', limit: 30
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['type'], name: 'index_ckeditor_assets_on_type'
  end

  create_table 'links', force: :cascade do |t|
    t.string 'link'
    t.bigint 'audition_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['audition_id'], name: 'index_links_on_audition_id'
  end

  create_table 'songs', force: :cascade do |t|
    t.string 'link'
    t.bigint 'audition_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['audition_id'], name: 'index_songs_on_audition_id'
  end

  create_table 'tracks', force: :cascade do |t|
    t.string 'title'
    t.bigint 'album_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['album_id'], name: 'index_tracks_on_album_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'role'
    t.string 'country'
    t.text 'bio'
    t.string 'website_link'
    t.string 'social_link', default: [], array: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'albums', 'users'
  add_foreign_key 'auditions', 'users'
  add_foreign_key 'links', 'auditions'
  add_foreign_key 'songs', 'auditions'
  add_foreign_key 'tracks', 'albums'
end
