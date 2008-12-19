class Element < ActiveRecord::Base
  belongs_to :configuration
  belongs_to :user
  belongs_to :specification, :polymorphic => true
end
