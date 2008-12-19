class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.belongs_to :output
      t.belongs_to :input
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :connections
  end
end
