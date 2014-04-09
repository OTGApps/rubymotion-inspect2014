Teacup::Stylesheet.new(:menu) do

  inspect_font = 'Prada'.uifont(25)
  sans_14 = 'JosefinSans-Bold'.uifont(14)

  style :root,
    backgroundColor: UIColor.clearColor

  style :header,
    constraints: [
      :top_left,
      :full_width,
      constrain_height(59)
    ]

  style :hash,
    frame: CGRectMake(10, 40, 20, 25),
    font: inspect_font,
    color: Settings.app_color,
    text: '#'

  style :title,
    frame: CGRectMake(30, 40, 190, 25),
    font: inspect_font,
    color: UIColor.blackColor,
    text: 'inspect 2014'

  style :talks,
    constraints: [
      :full_width,
      constrain_height(43),
      constrain_below(:header, 10),
    ],
    title: 'TALKS',
    titleFont: 'Cassannet Regular'.uifont(14),
    titleColor: UIColor.blackColor,
    image: 'icon-talks.png'.uiimage,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    imageEdgeInsets: UIEdgeInsetsMake(0, 14, 0, 0),
    titleEdgeInsets: UIEdgeInsetsMake(0, 24, 0, 0)

  style :location,
    constraints: [
      :full_width,
      constrain_height(43),
      constrain_below(:talks)
    ],
    title: 'LOCATION',
    titleFont: 'Cassannet Regular'.uifont(14),
    titleColor: UIColor.blackColor,
    image: 'icon-location.png'.uiimage,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    imageEdgeInsets: UIEdgeInsetsMake(0, 10, 0, 0),
    titleEdgeInsets: UIEdgeInsetsMake(0, 20, 0, 0)

  style :party,
    constraints: [
      :full_width,
      constrain_height(43),
      constrain_below(:location)
    ],
    title: 'PARTY',
    titleFont: 'Cassannet Regular'.uifont(14),
    titleColor: UIColor.blackColor,
    image: 'icon-beer.png'.uiimage,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    imageEdgeInsets: UIEdgeInsetsMake(0, 14, 0, 0),
    titleEdgeInsets: UIEdgeInsetsMake(0, 28, 0, 0)

  style :sponsors,
    backgroundImage: 'button-menu-ticket'.uiimage,
    constraints: [
      :left,
      constrain_width(119),
      constrain_height(36),
      constrain(:bottom).equals(:root, :bottom).minus(90)
    ],
    title: 'Sponsors',
    titleFont: sans_14,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    titleEdgeInsets: UIEdgeInsetsMake(-3, 15, 0, 0)

  style :about,
    backgroundImage: 'button-menu-ticket'.uiimage,
    constraints: [
      :left,
      constrain_width(119),
      constrain_height(36),
      constrain(:bottom).equals(:root, :bottom).minus(45)
    ],
    title: 'About',
    titleFont: sans_14,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    titleEdgeInsets: UIEdgeInsetsMake(-3, 15, 0, 0)
end
