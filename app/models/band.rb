class Band < ActiveRecord::Base
  belongs_to :user
  has_many :albums, :as => :performer
  has_many :shows, :as => :performer
  has_many :sounds, :as => :example
  has_many :participations, :as => :duration
end
