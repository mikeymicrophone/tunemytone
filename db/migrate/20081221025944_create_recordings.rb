class CreateRecordings < ActiveRecord::Migration
  def self.up
    create_table :recordings do |t|
      t.string :name
      t.belongs_to :excerpt
      t.belongs_to :user
      t.string   "audio_file_name"
      t.string   "audio_content_type"
      t.integer  "audio_file_size"
      t.datetime "audio_updated_at"

      t.timestamps
    end
  end

  def self.down
    drop_table :recordings
  end
end
