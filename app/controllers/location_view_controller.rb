class LocationViewController < InspectMapScreen
  stylesheet :location
  title 'The Location'

  def lat
    37.8078
  end

  def lon
    -122.4297
  end

  def pin_title
    'Fort Mason, San Francisco'
  end

end
