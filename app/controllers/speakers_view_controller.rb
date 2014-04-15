class SpeakersViewController < PM::Screen
  attr_accessor :speaker
  stylesheet :speaker
  title 'Speaker'

  layout :root do
    @scroll = subview(UIScrollView, :scroll) do
      @content = subview(UIView, :content) do
        @speaker_image = subview(UIImageView, :speaker_image)
        @speaker_name = subview(UILabel, :speaker_name)

        @speaker_company_line = subview(UIView, :line)
        @speaker_company = subview(UILabel, :speaker_company)

        @speaker_bio = subview(UILabel, :speaker_bio)

        @speaker_twitter = subview(UIButton.custom, :twitter)
        @speaker_www = subview(UIButton.custom, :www)
        subview(UIView, :padding)
      end
    end
  end

  def on_init
  end

  def will_appear
    @view_is_set_up ||= begin
      ap "speaker: #{@speaker}"
      s = speaker_properties
      ap s
      @speaker_image.image = s['speaker_image'].uiimage
      @speaker_name.text = s['name']
      @speaker_company.text = " #{s['company']}  "
      @speaker_bio.text = s['description']

      @speaker_twitter.on(:touch) do
        "https://twitter.com/#{s['twitter']}".nsurl.open
      end

      @speaker_www.on(:touch) do
        s['www'].nsurl.open
      end

      @scroll.contentSize = CGSizeMake(@content.frame.size.width, @content.frame.size.height + 44)

      true
    end
  end

  def speaker_properties
    @speakers ||= NSMutableArray.arrayWithContentsOfFile("speakers.plist".resource_path)
    return if @speaker < 0 || @speaker >= @speakers.length
    @speakers[@speaker]
  end

end
