class Element < ActiveRecord::Base
  belongs_to :configuration
  belongs_to :user
  belongs_to :specification, :polymorphic => true
  
  named_scope :instrumental, :conditions => {:specification_type => 'Instrument'}
end
