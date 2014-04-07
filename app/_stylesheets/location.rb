Teacup::Stylesheet.new(:location) do
  style :root,
    backgroundColor: UIColor.whiteColor

  style :map,
    constraints: [:top, :full_width]

  style :arrow,
    constraints: [:full_width, constrain_height(18), constrain_below(:map).minus(18)],
    image: 'speaker-arrow.png'.uiimage

  style :open_button,
    constraints: [:center_x],
    title: 'Open in Map'

  style :content,
    constraints: [constrain_below(:arrow), :full_width, constrain(:height).equals(:root, :height).minus(100)],
    backgroundColor: UIColor.whiteColor

  style :title,
    constraints: [constrain_width(220), :top, :center_x, constrain_height(25)],
    font: 'Cassannet Regular'.uifont(20),
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 0,
    lineHeight: 20,
    text: 'Fort Mason, San Francisco'

  style :dots,
    constraints: [constrain_width(220), constrain_below(:title, 10), :center_x, constrain_height(2)],
    image: 'dots.png'.uiimage

  style :description,
    constraints: [constrain_width(220), constrain_below(:dots, 10), :center_x, constrain_height(224)],
    font: 'Arvo'.uifont(14),
    numberOfLines: 0,
    text: "The conference will be held at Fort Mason, a former US Army post located in the Marina district of San Francisco. Protected as a National Historic Landmark, Fort Mason is located right on the water, conveniently accessible by car and public transportation, and is just a 10 minute walk from Fisherman's Wharf."

  style :title2,
    constraints: [constrain_width(220), :top, :center_x, constrain_height(25)],
    font: 'Cassannet Regular'.uifont(20),
    textAlignment: UITextAlignmentCenter,
    numberOfLines: 0,
    lineHeight: 20,
    text: "Délirium Café"

  style :dots2,
    constraints: [constrain_width(220), constrain_below(:title2, 10), :center_x, constrain_height(2)],
    image: 'dots.png'.uiimage

  style :description2,
    constraints: [constrain_width(220), constrain_below(:dots2, 10), :center_x, constrain_height(235)],
    font: 'Arvo'.uifont(11),
    numberOfLines: 0,
    text: "On Friday night you are invited to an awesome after-party at the Délirium Café.\n\nThe Délirium is known for its long beer list, standing at 2,004 different brands in January 2004 as recorded in the The Guinness Book of Records.\n\nThe bar is located in the small alley called Impasse de la Fidélité, only a couple of hundred metres from the Grand-Place. Don't miss the Jeanneke Pis statue nearby!"
end
