class Image < ActiveRecord::Base
  belongs_to :work
  
  # Paperclip
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :normal  => "220x170>" 
    }, 
    :path => ":rails_root/public/:class/:attachment/:id/:style:extension",
    :url => "/:class/:attachment/:id/:style:extension"
  
end
