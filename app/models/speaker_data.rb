class SpeakerData
  def self.sharedSpeakers
    Dispatch.once { @shared = self.new }
    @shared
  end

  def all
    return @speakers unless @speakers.nil?

    path = "speakers.plist"
    if path.document_path.file_exists?
      @speakers = NSMutableDictionary.dictionaryWithContentsOfFile(path.document_path)
      unless @speakers
        @speakers = NSMutableDictionary.dictionaryWithContentsOfFile(path.resource_path)
      end
    else
      @speakers = NSMutableDictionary.dictionaryWithContentsOfFile(path.resource_path)
    end

    App::Persistence['speakers_version'] ||= @speakers['version'] #Set it initially
    if App::Persistence['speakers_version'] != @speakers['version']
      App::Persistence['speakers_version'] = @speakers['version']

      # Clear all cache
      ap "Clearing speaker image cache"
      imageCache = SDImageCache.sharedImageCache
      imageCache.clearMemory
      imageCache.clearDisk
      imageCache.cleanDisk
    end

    @speakers['speakers']
  end
end
