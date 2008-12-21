class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :performer, :polymorphic => true
end
