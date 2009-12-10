class Image < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo, :storage => :filesystem,
                    :path => ":rails_root/public/uploads/:attachment/:id/:style/:basename.:extension",
                    :url => "/uploads/:attachment/:id/:style/:basename.:extension"
end
