Teacup::Stylesheet.new(:fonts) do

  style :font_inspect,
    font: 'Prada'.uifont(25)

  style :font_about,
    font: 'JosefinSans-Bold'.uifont(14)

  style :font_menu, extends: :font_about,
    titleFont: 'JosefinSans-Bold'.uifont(14)

  (10..20).each do |font_size|
    style "font_sans_#{font_size}".to_sym,
      font: 'JosefinSans-Bold'.uifont(font_size)
  end

end
