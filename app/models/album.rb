class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :performer, :polymorphic => true
  has_many :sounds, :as => :example
end
