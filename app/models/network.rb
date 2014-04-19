class Networking
  # TODO - Update this url once the PR is accepted
  #RAW_PATH = 'https://raw.githubusercontent.com/MohawkApps/rubymotion-inspect2014/master/resources/'
  RAW_PATH = 'https://raw.githubusercontent.com/MohawkApps/rubymotion-inspect2014/location-party-plist/resources/'

  def self.cache_data
    ['talks.plist', 'speakers.plist', 'sponsors.plist', 'location.plist', 'party.plist'].each do |cache_file|
      AFMotion::HTTP.get("#{RAW_PATH}#{cache_file}", q: Time.now.to_i) do |result|
        ap "Caching #{cache_file}" if BW.debug?
        if result && result.body
          path = cache_file.document_path
          path.remove_file! if path.file_exists?
          NSFileManager.defaultManager.createFileAtPath(path, contents: result.body, attributes: nil)

          "talks_cached".post_notification if cache_file.start_with?('talks')
        end
      end
    end
  end
end
