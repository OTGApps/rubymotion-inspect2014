class PartyViewController < InspectMapScreen
  stylesheet :party
  title 'The After-Party'

  def lat
    50.848418
  end

  def lon
    4.353877
  end

  def pin_title
    'Delirium Café'
  end

  def span
    0.001
  end
end
