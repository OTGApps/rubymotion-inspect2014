Teacup::Stylesheet.new(:break_cell) do
  import :fonts

  style :content_view,
    gradient: {
      colors: ['#ffffff'.uicolor]
    },
    clipsToBounds: true

  style :time, extends: :font_sans_18,
    text: '00:00',
    textColor: '#535353'.uicolor,
    frame: CGRectMake(0, 0, 80, 32),
    textAlignment: NSTextAlignmentCenter

  style :title, extends: :font_about,
    textColor: '#6a6a6a'.uicolor,
    text: 'Break',
    frame: CGRectMake(100, 6, 200, 20)

  style :icon,
    frame: CGRectMake(70, 5, 21, 21),
    image: 'coffee-cup'.uiimage

  style :line,
    frame: CGRectMake(80, 0, 1, 80),
    backgroundColor: Settings.grey_color

end
