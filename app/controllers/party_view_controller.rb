class PartyViewController < InspectMapScreen
  stylesheet :party
  title 'The After-Party'

  def map_data_file
    'party.plist'
  end
end
