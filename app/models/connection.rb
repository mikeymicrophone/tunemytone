class Connection < ActiveRecord::Base
  belongs_to :output
  belongs_to :input
  belongs_to :user
  has_many :elements, :as => :specification
  has_many :configurations, :through => :elements
  
  def source
    output.host
  end
  
  def sink
    input.host
  end
end
