class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :name
      t.string :performer_type
      t.integer :performer_id
      t.date :released_on
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
