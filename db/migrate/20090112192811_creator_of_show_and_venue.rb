class CreatorOfShowAndVenue < ActiveRecord::Migration
  def self.up
    add_column :venues, :user_id, :integer
    add_column :shows, :user_id, :integer
  end

  def self.down
    remove_column :venues, :user_id
    remove_column :shows, :user_id
  end
end
