Teacup::Stylesheet.new :maps do
  import :fonts

  style :root,
    backgroundColor: UIColor.whiteColor

  style :map,
    constraints: [:top, :full_width]

  style :arrow,
    constraints: [:full_width, constrain_height(18), constrain_below(:map).minus(18)],
    image: 'speaker-arrow'.uiimage

  style :open_button,
    constraints: [:center_x],
    title: 'Open in Map'

  style :content,
    constraints: [constrain_below(:arrow), :full_width, constrain(:height).equals(:root, :height).minus(100)],
    backgroundColor: UIColor.whiteColor

  style :title, extends: :font_sans_20,
    constraints: [constrain_width(220), :top, :center_x, constrain_height(25)],
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 0,
    lineHeight: 20

  style :line,
    constraints: [constrain_below(:title, 10), constrain_size(220, 1), :center_x],
    backgroundColor: Settings.grey_color

  style :description, extends: :font_sans_15,
    constraints: [constrain_width(220), constrain_below(:line, 10), :center_x, constrain_height(224)],
    numberOfLines: 0

end
