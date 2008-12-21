class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :shows, :as => :performer
  has_many :albums, :as => :performer
end
