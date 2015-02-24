class Attachment < ActiveRecord::Base
  #attr_accessible :filename, :description, :file_object
  mount_uploader :file_object, ImageUploader

end