class GenericTableScreen < PM::TableScreen
  def on_init
    set_nav_bar_button :left, {
      target: App.delegate,
      image: 'menuicon'.uiimage,
      action: :show_menu,
      accessibility_label: "Menu"
    }
  end
end
