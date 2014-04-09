Teacup::Stylesheet.new(:talks) do
  style :root,
    backgroundColor: '#f0f0f0'.uicolor,
    constraints: [:full]

  style :header_view,
    height: 73,
    width: '100%',
    top: 60

  style :blur,
    frame: :full

end
