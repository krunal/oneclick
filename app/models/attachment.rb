class Attachment < ActiveRecord::Base
  #attr_accessible :filename, :description, :file_object
  mount_uploader :file_object, ImageUploader

  belongs_to :user

  def mlink
  	"/icis/files/#{Base64.encode64(id.to_s).chomp}"
  end


end