class CreatePerformances < ActiveRecord::Migration
  def self.up
    create_table :performances do |t|
      t.belongs_to :song
      t.datetime :performed_at
      t.belongs_to :show
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :performances
  end
end
