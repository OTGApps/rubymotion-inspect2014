Teacup::Stylesheet.new(:sponsors) do
  style :root,
    backgroundColor: UIColor.whiteColor

  style :content,
    constraints: [:top, :full]

  style :heroku,
    constraints: [:top, :center_x, constrain_size(200, 144)],
    image: 'sponsors/heroku.png'.uiimage

  grey_dots = 'grey_dots.png'.uiimage
  vgrey_dots = 'vgrey_dots.png'.uiimage
  vgrey_dots_110 = 'vgrey_dots_110.png'.uiimage

  style :hdots1,
    constraints: [constrain_below(:heroku), :center_x, constrain_size(262, 2)],
    image: grey_dots

  style :jetbrains,
    constraints: [constrain(:left).equals(:content, :left).plus(25), constrain_below(:hdots1, 5), constrain_size(122, 144)],
    image: 'sponsors/jetbrains.png'.uiimage

  style :vdots1,
    constraints: [constrain_below(:hdots1, 5), :center_x, constrain_size(2, 142)],
    image: vgrey_dots

  style :cyrus,
    constraints: [constrain(:left).equals(:content, :left).plus(172), constrain_below(:hdots1, 5), constrain_size(122, 144) ],
    image: 'sponsors/cyrus-innovation.png'.uiimage

  style :hdots2,
    constraints: [constrain_below(:jetbrains, 5), :center_x, constrain_size(262, 2)],
    image: grey_dots

  style :nedap,
    constraints: [constrain(:left).equals(:content, :left).plus(25), constrain_below(:hdots2, 5), constrain_size(122, 144)],
    image: 'sponsors/nedap.png'.uiimage

  style :vdots2,
    constraints: [constrain_below(:hdots2, 5), :center_x, constrain_size(2, 142)],
    image: vgrey_dots

  style :boxcar,
    constraints: [constrain(:left).equals(:content, :left).plus(172), constrain_below(:hdots2, 5), constrain_size(122, 144) ],
    image: 'sponsors/boxcar.png'.uiimage

  style :hdots3,
    constraints: [constrain_below(:nedap, 5), :center_x, constrain_size(262, 2)],
    image: grey_dots

  style :pragmatic,
    constraints: [constrain(:left).equals(:content, :left).plus(45), constrain_below(:hdots3, 5), constrain_size(92, 110) ],
    image: 'sponsors/pragmatic-studio.png'.uiimage

  style :vdots3,
    constraints: [constrain_below(:hdots3, 5), :center_x, constrain_size(2, 110)],
    image: vgrey_dots_110

  style :belighted,
    constraints: [constrain(:left).equals(:content, :left).plus(182), constrain_below(:hdots3, 5), constrain_size(92, 110) ],
    image: 'sponsors/belighted.png'.uiimage
end
