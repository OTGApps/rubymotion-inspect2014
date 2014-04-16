class GenericScreen < PM::Screen
  def on_init
    set_nav_bar_button :left, {
      target: App.delegate,
      image: 'menuicon'.uiimage,
      action: :show_menu,
      accessibility_label: "Menu"
    }
  end

  def on_appear
    label = UILabel.alloc.initWithFrame([[0,0],[198,44]])
    label.backgroundColor = :clear.uicolor
    label.setFont('Prada'.uifont(25))
    label.textAlignment = UITextAlignmentCenter
    label.textColor = :black.uicolor
    label.adjustsFontSizeToFitWidth = true
    label.text = self.navigationItem.title
    self.navigationItem.titleView = label
    self.navigationItem.titleView.origin = [0,0]
  end
end
