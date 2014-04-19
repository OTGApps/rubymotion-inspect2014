class LocationViewController < InspectMapScreen
  stylesheet :location
  title 'The Location'

  def map_data_file
    'location.plist'
  end
end
