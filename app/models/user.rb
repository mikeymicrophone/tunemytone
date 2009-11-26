class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :brands
  has_many :configurations
  has_many :connections
  has_many :effects
  has_many :elements
  has_many :inputs
  has_many :instruments
  has_many :knobs
  has_many :outputs
  has_many :settings
  has_many :albums
  has_many :artists
  has_many :bands
  has_many :images
  has_many :participations
  has_many :performances
  has_many :recordings
  has_many :shows
  has_many :songs
  has_many :sounds
  has_many :venues
  
  def name
    login
  end
end
