class AvatarUploader < CarrierWave::Uploader::Base
  require 'carrierwave/orm/activerecord'


  storage :file

  def store_dir
    'public/my/upload/directory'
  end
  
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
