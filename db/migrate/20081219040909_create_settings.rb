class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.belongs_to :knob
      t.belongs_to :user
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
