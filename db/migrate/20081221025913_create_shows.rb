class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.belongs_to :venue
      t.string :performer_type
      t.integer :performer_id
      t.datetime :performed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
