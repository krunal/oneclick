# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "#{model.class.to_s.underscore.downcase}/#{mounted_as}/missing/" + [version_name, 'missing.png'].compact.join('_')
  end

  process :convert => 'png'

  version :big do
    process :convert => 'png'
    process :resize_to_fit => [1280, 1280]
    process :quality => 100
  end

  version :medium do
    process :convert => 'png'
    process :resize_to_fit => [700, 700]
    process :quality => 100
  end

  version :small do
    process :convert => 'png'
    process :resize_to_fit => [50, 50]
    process :quality => 100
  end

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  #Process files as they are uploaded:
  # process :scale => [100, 2000]
  #
  # def scale(width, height)
  #   # do something
  # end

  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png bmp tif tiff)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "#{model.nicely_formatted_filename}.png"
  # end


  private

  
end
