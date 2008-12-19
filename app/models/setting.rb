class Setting < ActiveRecord::Base
  belongs_to :knob
  belongs_to :user
  has_many :elements, :as => :specification

  def host
    knob.host
  end
  
  def configurations
    elements.map(&:configuration)
  end
end
