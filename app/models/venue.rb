class Venue < ActiveRecord::Base
  belongs_to :user
  has_many :shows
end
