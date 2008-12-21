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
end
