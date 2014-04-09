Teacup::Stylesheet.new(:about) do
  inspect_font = 'Prada'.uifont(25)
  body_font = 'JosefinSans-Bold'.uifont(14)
  sans_10 = 'JosefinSans-Bold'.uifont(10)
  sans_15 = 'JosefinSans-Bold'.uifont(15)

  style :root,
    backgroundColor: UIColor.whiteColor

  style :content,
    width: Device.screen.width,
    height: Device.screen.height,
    alwaysBounceVertical: true

  rm_image = 'logo-rubymotion'.uiimage

  style :rubymotion,
    constraints: [constrain_top(20), :center_x, constrain_size(rm_image.size.width, rm_image.size.height)],
    image: rm_image

  style :title,
    constraints: [:full_width, constrain_below(:rubymotion, 10), :center_x, constrain_height(30)],
    font: inspect_font,
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 1,
    text: '#inspect 2014'

  style :about,
    constraints: [constrain_width(Device.screen.width - 40), constrain_below(:title, 10), :center_x, constrain_height(180)],
    font: body_font,
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 0,
    text: "A RubyMotion Conference\nwww.rubymotion.com\n\nOrganized by HipByte & InfiniteRed\ninfo@hipbyte.com\n\nWith the help of:\nMark Rickert, Gant Laborde\n\nCopyright © HipByte SPRL 2012-2014"

  tw_image = 'twitter-about'.uiimage

  style :twitter,
    constraints: [
      :center_x,
      constrain_size(tw_image.size.width, tw_image.size.height),
      constrain_below(:about, 5),
    ],
    image: tw_image

  style :twitter_title,
    constraints: [:full_width, constrain_below(:twitter, 5), :center_x, constrain_height(18)],
    font: sans_15,
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 1,
    text: 'FOLLOW US'

  style :line,
    constraints: [constrain_below(:twitter_title, 10), constrain_size(220, 1), :center_x],
    backgroundColor: '#c6c6c6'.uicolor

  style :made_by,
    backgroundColor: UIColor.whiteColor,
    constraints: [constrain_below(:twitter_title, 7), constrain_size(60, 10), :center_x],
    font: sans_10,
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 1,
    text: 'MADE BY'

  style :made_by_icons,
    constraints: [
      :center_x,
      constrain_below(:line, 20),
      constrain_size(160, 80)
    ]

  mohawk_image = 'logo_mohawkapps'.uiimage
  style :mohawk,
    constraints: [
      :top,
      :left,
      constrain_size(mohawk_image.size.width, mohawk_image.size.height),
    ],
    image: mohawk_image

  iconoclast_image = 'logo_iconoclast'.uiimage
  style :iconoclast,
    constraints: [
      :top,
      :right,
      constrain_size(iconoclast_image.size.width, iconoclast_image.size.height),
    ],
    image: iconoclast_image

end
