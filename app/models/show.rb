class Show < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :performer, :polymorphic => true
  has_many :sounds, :as => :example
  has_many :participations, :as => :duration
  has_many :performances
  has_many :songs, :through => :performances
  
  def name
    performer.name + ' at ' + venue.name + ' on ' + performed_at.to_s
  end
end
