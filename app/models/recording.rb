class Recording < ActiveRecord::Base
  belongs_to :excerpt
  belongs_to :user
  has_many :sounds, :as => :example
  
  has_attached_file :audio, :storage => :filesystem,
                    :path => ":rails_root/public/uploads/:attachment/:id/:basename.:extension"
  
end
