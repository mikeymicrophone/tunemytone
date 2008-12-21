class Excerpt < ActiveRecord::Base
  belongs_to :user
  belongs_to :context, :polymorphic => true
  has_many :sounds, :as => :example
end
