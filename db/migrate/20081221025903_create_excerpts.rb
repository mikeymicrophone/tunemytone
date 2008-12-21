class CreateExcerpts < ActiveRecord::Migration
  def self.up
    create_table :excerpts do |t|
      t.string :context_type
      t.integer :context_id
      t.string :description
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :excerpts
  end
end
