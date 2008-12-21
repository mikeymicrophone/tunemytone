class Excerpt < ActiveRecord::Base
  belongs_to :user
  belongs_to :context, :polymorphic => true
end
