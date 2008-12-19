class Configuration < ActiveRecord::Base
  belongs_to :user
  has_many :elements
  has_many :uses, :as => :specification, :class_name => 'Element'
end
