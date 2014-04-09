Teacup::Stylesheet.new(:schedule_cell) do
  import :fonts

  style :content_view,
    gradient: {
      colors: ['#efefef'.uicolor, '#e1e1e1'.uicolor]
    }

  style :time, extends: :font_sans_18,
    text: '00:00',
    textColor: '#535353'.uicolor,
    backgroundColor: UIColor.clearColor,
    frame: CGRectMake(0, 0, 80, 32),
    textAlignment: UITextAlignmentCenter

  style :title, extends: :font_about,
    backgroundColor: UIColor.clearColor,
    fontColor: '#6a6a6a'.uicolor,
    text: 'Break',
    frame: CGRectMake(100, 6, 200, 18),
    lineHeight: 14 * 1.1,
    maxNumberOfLines: 2

  style :speaker, extends: :font_about,
    backgroundColor: UIColor.clearColor,
    textColor: '#6a6a6a'.uicolor,
    text: 'Laurent Sansonetti'.upcase,
    frame: CGRectMake(135, 47, 165, 10)

  style :speaker_company, extends: :font_sans_12,
    backgroundColor: UIColor.clearColor,
    textColor: '#6a6a6a'.uicolor,
    frame: CGRectMake(135, 59, 165, 12)

  style :speaker_image,
    frame: CGRectMake(100, 45, 26, 26)

  style :icon,
    frame: CGRectMake(70, 5, 21, 21),
    image: 'coffee-cup'.uiimage

  style :ticket,
    frame: CGRectMake(312, 0, 8, 80),
    image: 'cell-ticket'.uiimage

  style :dot,
    frame: CGRectMake(70, 5, 21, 21),
    image: 'dot'.uiimage

  style :line,
    frame: CGRectMake(80, 0, 1, 32),
    backgroundColor: Settings.grey_color

  style :line2,
    frame: CGRectMake(80, 0, 1, 80),
    backgroundColor: Settings.grey_color

  style :frame,
    frame: CGRectMake(100, 45, 26, 26),
    image: 'speaker-small-frame'.uiimage

end
