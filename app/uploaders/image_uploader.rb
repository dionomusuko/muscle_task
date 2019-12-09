class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  process resize_to_limit: [700, 700]
  storage :file

  if Rails.env.production? || Rails.env.staging?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
   process resize_to_fit: [50, 50]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    original_filename if original_filename
  end
end
