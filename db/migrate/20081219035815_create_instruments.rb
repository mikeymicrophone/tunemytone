class CreateInstruments < ActiveRecord::Migration
  def self.up
    create_table :instruments do |t|
      t.string :name
      t.belongs_to :brand
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :instruments
  end
end
