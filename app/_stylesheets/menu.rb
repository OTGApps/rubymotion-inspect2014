Teacup::Stylesheet.new(:menu) do
  import :fonts

  style :root,
    backgroundColor: UIColor.clearColor

  style :header,
    constraints: [
      :top_left,
      :full_width,
      constrain_height(59)
    ]

  style :hash, extends: :font_inspect,
    frame: CGRectMake(10, 40, 20, 25),
    color: Settings.app_color,
    text: '#'

  style :title, extends: :font_inspect,
    frame: CGRectMake(30, 40, 190, 25),
    color: UIColor.blackColor,
    text: 'inspect 2014'

  style :menu_buttons, extends: :font_menu,
    titleColor: UIColor.blackColor,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    imageEdgeInsets: UIEdgeInsetsMake(0, 14, 0, 0),
    titleEdgeInsets: UIEdgeInsetsMake(0, 24, 0, 0),
    constraints: [
      :full_width,
      constrain_height(43),
    ]


  style :talks, extends: :menu_buttons,
    constraints: [
      constrain_below(:header, 10),
    ],
    title: 'TALKS',
    image: 'menu-talks'.uiimage

  style :location, extends: :menu_buttons,
    constraints: [
      constrain_below(:talks)
    ],
    title: 'LOCATION',
    image: 'menu-location'.uiimage

  style :party, extends: :menu_buttons,
    constraints: [
      constrain_below(:location)
    ],
    title: 'PARTY',
    image: 'menu-beer'.uiimage

  style :bottom_buttons, extends: :font_menu,
    backgroundImage: 'button-menu-ticket'.uiimage,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    titleEdgeInsets: UIEdgeInsetsMake(-3, 15, 0, 0)

  style :sponsors, extends: :bottom_buttons,
    constraints: [
      :left,
      constrain_width(119),
      constrain_height(36),
      constrain(:bottom).equals(:root, :bottom).minus(90)
    ],
    title: 'Sponsors'

  style :about, extends: :bottom_buttons,
    constraints: [
      :left,
      constrain_width(119),
      constrain_height(36),
      constrain(:bottom).equals(:root, :bottom).minus(45)
    ],
    title: 'About'
end
