class CreateKnobs < ActiveRecord::Migration
  def self.up
    create_table :knobs do |t|
      t.string :host_type
      t.integer :host_id
      t.string :name
      t.integer :discrete
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :knobs
  end
end
