class Networking
  def self.cache_data
    raw_path = 'https://raw.githubusercontent.com/MohawkApps/rubymotion-inspect2014/master/resources/'
    ['talks.plist', 'speakers.plist', 'sponsors.plist'].each do |cache_file|
      AFMotion::HTTP.get("#{raw_path}#{cache_file}", q: Time.now.to_i) do |result|
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
