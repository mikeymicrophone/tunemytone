class CreateInputs < ActiveRecord::Migration
  def self.up
    create_table :inputs do |t|
      t.string :host_type
      t.integer :host_id
      t.string :description
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :inputs
  end
end
