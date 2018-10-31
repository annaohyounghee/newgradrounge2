class AvatarUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  def default_url(*args)
    "http://res.cloudinary.com/darri/image/upload/v1450214068/osfb67hxdbv5dcllbger.png"
  end


end
