class InspectMapScreen < GenericScreen

  layout :root do |v|
    @map = subview(MKMapView, :map)
    @map.delegate = self
    @map.zoomEnabled = false
    @map.scrollEnabled = false
    @map.mapType = MKMapTypeHybrid
    @map.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(map_data['latitude'], map_data['longitude']), MKCoordinateSpanMake(map_data['span'], map_data['span']))

    @map_height_constraint = Teacup::Constraint.new(@map, :height).equals(150).nslayoutconstraint
    @map.addConstraint(@map_height_constraint)

    @map_tap = UITapGestureRecognizer.alloc.initWithTarget(self, action: "map_tapped:")
    @map.addGestureRecognizer(@map_tap)

    @open_button = subview(UIButton.custom, :open_button)
    @open_button.addConstraint Teacup::Constraint.new(@open_button, :width).equals(184).nslayoutconstraint
    @open_button.addConstraint Teacup::Constraint.new(@open_button, :height).equals(58).nslayoutconstraint
    @open_button_top_constraint = Teacup::Constraint.new(@open_button, :top).equals(@map, :bottom).nslayoutconstraint
    v.addConstraint @open_button_top_constraint

    @open_button.titleLabel.font = 'JosefinSans-Bold'.uifont(14)
    @open_button.setBackgroundColor(Settings.app_color)
    @open_button.setTitleColor(UIColor.whiteColor, forState: :normal.uicontrolstate)

    @open_button.on(:touch) do
      self.button_tapped(self)
    end

    @scroll = subview(UIScrollView, :content) do
      subview(MTLabel, :title, {text: map_data['place']})
      subview(UIView, :line)
      subview(UILabel, :description, {text:map_data['description'].gsub('\\n', "\n")})
    end
  end

  def mapViewDidFinishLoadingMap(map)
    @pin = MKPointAnnotation.alloc.init
    @pin.coordinate = @map.region.center
    @pin.title = map_data['pin_title']
    @map.addAnnotation @pin
  end

  def mapView(map, viewForAnnotation: annotation)
    MKPinAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier: 'pin')
  end

  def map_tapped(sender)
    UIView.animateWithDuration(0.5, animations: lambda do
      if @map_height_constraint.constant == 150
        @map_height_constraint.constant = 360
        @open_button_top_constraint.constant = -75
      else
        @map_height_constraint.constant = 150
        @open_button_top_constraint.constant = 0
      end
      self.view.setNeedsUpdateConstraints
      self.view.layoutIfNeeded
    end)
  end

  def button_tapped(sender)
    "http://maps.apple.com/?ll=#{map_data['latitude']},#{map_data['longitude']}&spn=#{map_data['span']}&q=#{map_data['pin_title']}".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding).nsurl.open
  end

  def viewDidLayoutSubviews
    @scroll.contentSize = CGSizeMake(320, 400)
  end

  def map_data
    @map_data ||= begin
      path = map_data_file
      if path.document_path.file_exists?
        data = NSMutableDictionary.dictionaryWithContentsOfFile(path.document_path)
        unless data
          data = NSMutableDictionary.dictionaryWithContentsOfFile(path.resource_path)
        end
      else
        data = NSMutableDictionary.dictionaryWithContentsOfFile(path.resource_path)
      end
      data
    end
  end
end
