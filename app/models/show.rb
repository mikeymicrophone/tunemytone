class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :performer, :polymorphic => true
  has_many :participations, :as => :duration
end
