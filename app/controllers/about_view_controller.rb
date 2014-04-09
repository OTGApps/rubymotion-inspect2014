class AboutViewController < GenericScreen
  stylesheet :about
  title 'About'

  layout :root do
    @scroll = subview(UIScrollView, :content) do
      subview(UIImageView, :rubymotion)
      subview(UILabel, :title)
      subview(UILabel, :about)
      subview(UIButton.custom, :twitter).on(:touch) do
        open_twitter
      end
      subview(UILabel, :twitter_title)
      subview(UIView, :line)
      subview(UILabel, :made_by)

      made_by_icons = subview(UIView, :made_by_icons) do
        subview(UIButton.custom, :mohawk).on(:touch) do
          open_mohawk
        end
        subview(UIButton.custom, :iconoclast).on(:touch) do
          open_iconoclast
        end
      end

    end
  end

  def viewDidLayoutSubviews
    scrollViewHeight = 0

    @scroll.subviews.each do |view|
      if scrollViewHeight < view.frame.origin.y + view.frame.size.height
        scrollViewHeight = view.frame.origin.y + view.frame.size.height
      end
    end

    @scroll.contentSize = CGSizeMake(@scroll.frame.size.width, scrollViewHeight)
  end

  def open_twitter
    "https://twitter.com/RubyMotion".nsurl.open
  end

  def open_mohawk
    "http://www.mohawkapps.com".nsurl.open
  end

  def open_iconoclast
    "http://www.iconoclastlabs.com".nsurl.open
  end
end
