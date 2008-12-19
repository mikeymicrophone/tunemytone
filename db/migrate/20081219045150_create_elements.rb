class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      t.string :specification_type
      t.integer :specification_id
      t.belongs_to :configuration
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :elements
  end
end
