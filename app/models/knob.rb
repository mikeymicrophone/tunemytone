class Knob < ActiveRecord::Base
  belongs_to :user
  belongs_to :host, :polymorphic => true
  has_many :settings
end
