Teacup::Stylesheet.new :maps do
  import :fonts

  style :root,
    backgroundColor: UIColor.whiteColor

  style :map,
    constraints: [:top, :full_width]

  style :open_button,
    constraints: [:center_x],
    title: 'Open in Maps'

  style :content,
    constraints: [constrain_below(:map), :full_width, constrain(:height).equals(:root, :height).minus(100)],
    backgroundColor: UIColor.whiteColor

  style :title, extends: :font_sans_20,
    constraints: [constrain_width(220), constrain_top(15), :center_x, constrain_height(25)],
    textAlignment: NSTextAlignmentCenter,
    numberOfLines: 0,
    lineHeight: 20

  style :line,
    constraints: [constrain_below(:title, 10), constrain_size(220, 1), :center_x],
    backgroundColor: Settings.grey_color

  style :description, extends: :font_sans_15,
    constraints: [constrain_width(220), constrain_below(:line, 10), :center_x, constrain_height(224)],
    numberOfLines: 0

end
