class Participation < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user
  belongs_to :duration, :polymophic => true
end
