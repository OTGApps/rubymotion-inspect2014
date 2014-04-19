Teacup::Stylesheet.new(:schedule_cell) do
  import :fonts
  import :break_cell

  style :title, extends: :font_about,
    lineHeight: 14 * 1.1,
    maxNumberOfLines: 2

  style :speaker, extends: :font_sans_12,
    textColor: '#6a6a6a'.uicolor,
    text: 'Laurent Sansonetti'.upcase,
    frame: CGRectMake(135, 47, 165, 10)

  style :speaker_company, extends: :font_sans_12,
    textColor: '#6a6a6a'.uicolor,
    frame: CGRectMake(135, 59, 165, 12)

  style :speaker_image,
    frame: CGRectMake(100, 45, 26, 26)

  style :icon,
    image: 'coffee-cup'.uiimage

  style :ticket,
    frame: CGRectMake(312, 0, 8, 80),
    image: 'ticket'.uiimage

  style :dot,
    frame: CGRectMake(70, 5, 21, 21),
    image: 'dot'.uiimage

  style :frame,
    frame: CGRectMake(100, 45, 26, 26),
    image: 'speaker-small-frame'.uiimage

end
