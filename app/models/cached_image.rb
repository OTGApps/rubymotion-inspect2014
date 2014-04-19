class CachedImage < UIImageView
  # TODO - Change this constant after the PR is merged into master.
  # URL_PREFIX = 'https://raw.githubusercontent.com/MohawkApps/rubymotion-inspect2014/master/'
  URL_PREFIX = 'https://raw.githubusercontent.com/MohawkApps/rubymotion-inspect2014/speaker-image-caching/'
  attr_accessor :placeholder

  def set_image(i)
    image_url = "#{URL_PREFIX}#{i}".nsurl
    setImageWithURL(image_url, placeholderImage:placeholder.uiimage)
  end
end
