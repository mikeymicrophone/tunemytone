class Performance < ActiveRecord::Base
  belongs_to :song
  belongs_to :show
  belongs_to :user
  has_many :excerpts, :as => :context
  has_many :sounds, :as => :example
  has_many :participations, :as => :duration
end
