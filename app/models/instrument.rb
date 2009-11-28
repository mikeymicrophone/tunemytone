class Instrument < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  has_many :inputs, :as => :host
  has_many :outputs, :as => :host
  has_many :knobs, :as => :host
  has_many :elements, :as => :specification
  has_many :configurations, :through => :elements
  
  def connections
    inputs.map(&:connections).flatten + outputs.map(&:connections).flatten
  end
  
  def connected_devices
    inputs.map(&:outputs).flatten.map(&:host) + outputs.map(&:inputs).flatten.map(&:host)
  end
end
