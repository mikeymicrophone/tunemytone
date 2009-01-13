class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :shows, :as => :performer
  has_many :sounds, :as => :example
  has_many :albums, :as => :performer
  has_many :participations
end
