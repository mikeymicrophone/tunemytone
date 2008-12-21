class Sound < ActiveRecord::Base
  belongs_to :configuration
  belongs_to :example, :polymorphic => true
  belongs_to :user
end
