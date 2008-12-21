class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.belongs_to :artist
      t.string :duration_type
      t.integer :duration_id
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
