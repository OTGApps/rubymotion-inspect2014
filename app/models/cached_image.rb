class CachedImage < UIImageView
  URL_PREFIX = 'https://raw.githubusercontent.com/MohawkApps/rubymotion-inspect2014/speaker_photos/'
  attr_accessor :placeholder

  def set_image(i)
    image_url = "#{URL_PREFIX}#{i}".nsurl
    setImageWithURL(image_url, placeholderImage:placeholder.uiimage)
  end
end
