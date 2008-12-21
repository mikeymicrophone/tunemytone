class CreateSounds < ActiveRecord::Migration
  def self.up
    create_table :sounds do |t|
      t.belongs_to :configuration
      t.string :example_type
      t.integer :example_id
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :sounds
  end
end
