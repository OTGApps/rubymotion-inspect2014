Teacup::Stylesheet.new(:speaker) do
  import :fonts

  style :root,
    backgroundColor: UIColor.whiteColor

  style :scroll,
    frame: :full,
    alwaysBounceVertical: true

  style :content,
    frame: :full

  style :speaker_image,
    height: 336,
    constraints: [:top, :left, :full_width]

  style :speaker_name, extends: :font_sans_18,
    constraints: [:full_width, constrain_below(:speaker_image, 10), :center_x, constrain_height(30)],
    textAlignment: NSTextAlignmentCenter,
    numberOfLines: 1

  style :line,
    constraints: [constrain_below(:speaker_name, 10), constrain_size(220, 1), :center_x],
    backgroundColor: Settings.grey_color

  style :speaker_company, extends: :font_sans_14,
    backgroundColor: UIColor.whiteColor,
    constraints: [constrain_below(:speaker_name, 5), :center_x],
    textAlignment: NSTextAlignmentCenter,
    numberOfLines: 1

  style :speaker_bio, extends: :font_sans_16,
    constraints: [constrain_below(:speaker_company, 20), constrain_width(220), :center_x],
    textAlignment: NSTextAlignmentLeft,
    numberOfLines: 0

  twitter_image = 'twitter'.uiimage
  style :twitter,
    constraints: [
      constrain_below(:speaker_bio, 20),
      constrain(:left).equals(:superview, :left).plus(Device.screen.width / 4),
      constrain_size(twitter_image.size.width, twitter_image.size.height)
    ],
    image: twitter_image

  www_image = 'www'.uiimage
  style :www,
    constraints: [
      constrain_below(:speaker_bio, 20),
      constrain(:right).equals(:superview, :right).minus(Device.screen.width / 4),
      constrain_size(www_image.size.width, www_image.size.height)
    ],
    image: www_image

  style :padding,
    constraints: [constrain_below(:www, 20), constrain_size(220, 1)]
end
