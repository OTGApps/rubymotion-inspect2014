# -*- encoding : utf-8 -*-
class RMIAboutViewController < PM::Screen
  stylesheet :about
  title 'About'

  def on_init
    set_nav_bar_button :left, {
      target: App.delegate,
      image: 'menuicon.png'.uiimage,
      action: :show_menu,
      accessibility_label: "Menu"
    }
  end

  layout :root do
    @scroll = subview(UIScrollView, :content) do
      subview(UIImageView, :rubymotion)
      subview(UILabel, :title)
      subview(UILabel, :about)
      subview(UIButton.custom, :twitter).on(:touch) do
        self.open_twitter
      end
      subview(UILabel, :twitter_title)
      subview(UIView, :line)
      subview(UIButton.custom, :epic).on(:touch) do
        self.open_epic
      end
    end
  end

  def viewDidLayoutSubviews
    @scroll.contentSize = CGSizeMake(320, 500)
  end

  def open_twitter
    "https://twitter.com/RubyMotion".nsurl.open
  end

  def open_epic
    "http://epic.net".nsurl.open
  end
end
