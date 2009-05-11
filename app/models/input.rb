class Input < ActiveRecord::Base
  belongs_to :user
  belongs_to :host, :polymorphic => true
  has_many :connections
  has_many :outputs, :through => :connections
  has_many :elements, :through => :connections
  
  def configurations
    elements.map(&:configuration)
  end
  
  def name
    host.name + ' ' + description
  end
end
