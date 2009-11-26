class Song < ActiveRecord::Base
  belongs_to :user
  has_many :sounds, :as => :example
  has_many :excerpts, :as => :context
  has_many :performances
  has_many :shows, :through => :performances
end
