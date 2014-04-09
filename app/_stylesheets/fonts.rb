Teacup::Stylesheet.new(:fonts) do

  style :font_inspect,
    font: 'Prada'.uifont(25)

  style :font_about,
    font: 'JosefinSans-Bold'.uifont(14)

  style :font_menu, extends: :font_about,
    titleFont: 'JosefinSans-Bold'.uifont(14)

  style :font_sans_10,
    font: 'JosefinSans-Bold'.uifont(10)
  style :font_sans_15,
    font: 'JosefinSans-Bold'.uifont(15)
  style :font_sans_20,
    font: 'JosefinSans-Bold'.uifont(20)

end
