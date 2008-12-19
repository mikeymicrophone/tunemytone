class Instrument < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  has_many :inputs, :as => :host
  has_many :outputs, :as => :host
  has_many :knobs, :as => :host
  has_many :elements, :as => :specification
  has_many :configurations, :through => :elements
end
