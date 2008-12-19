class Effect < ActiveRecord::Base
  belongs_to :brand
  belongs_to :user
  has_many :knobs, :as => :host
  has_many :inputs, :as => :host
  has_many :outputs, :as => :host
end
