class LocationViewController < GenericScreen
  stylesheet :location
  title 'The Location'

  layout :root do |v|
    @map = subview(MKMapView, :map)
    @map.delegate = self
    @map.zoomEnabled = false
    @map.scrollEnabled = false
    @map.mapType = MKMapTypeHybrid
    @map.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.8078, -122.4297), MKCoordinateSpanMake(0.02, 0.02))

    @map_height_constraint = Teacup::Constraint.new(@map, :height).equals(100).nslayoutconstraint
    @map.addConstraint(@map_height_constraint)

    @map_tap = UITapGestureRecognizer.alloc.initWithTarget(self, action: "map_tapped:")
    @map.addGestureRecognizer(@map_tap)

    @open_button = subview(UIButton.custom, :open_button)
    default_image = 'button-ticket-active'.uiimage
    @open_button.addConstraint Teacup::Constraint.new(@open_button, :width).equals(default_image.size.width).nslayoutconstraint
    @open_button.addConstraint Teacup::Constraint.new(@open_button, :height).equals(default_image.size.height).nslayoutconstraint
    @open_button_top_constraint = Teacup::Constraint.new(@open_button, :top).equals(@map, :bottom).nslayoutconstraint
    v.addConstraint @open_button_top_constraint

    @open_button.titleLabel.font = 'JosefinSans-Bold'.uifont(11)
    @open_button.setBackgroundImage(default_image, forState: :normal.uicontrolstate)
    @open_button.setTitleColor(UIColor.whiteColor, forState: :normal.uicontrolstate)

    @open_button.on(:touch) do
      self.button_tapped(self)
    end

    subview(UIImageView, :arrow)
    @scroll = subview(UIScrollView, :content) do
      subview(MTLabel, :title)
      subview(UIView, :line)
      subview(UILabel, :description)
    end

    self.navigationController.navigationBar.translucent = false
    self.automaticallyAdjustsScrollViewInsets = false
    self.edgesForExtendedLayout = UIRectEdgeNone
  end

  def mapViewDidFinishLoadingMap(map)
    @pin = MKPointAnnotation.alloc.init
    @pin.coordinate = @map.region.center
    @pin.title = 'Fort Mason, San Francisco'
    @map.addAnnotation @pin
  end

  def mapView(map, viewForAnnotation: annotation)
    MKPinAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier: 'pin')
  end

  def map_tapped(sender)
    UIView.animateWithDuration(0.5, animations: lambda do
      if @map_height_constraint.constant == 100
        @map_height_constraint.constant = 360
        @open_button_top_constraint.constant = -50
      else
        @map_height_constraint.constant = 100
        @open_button_top_constraint.constant = 0
      end
      self.view.setNeedsUpdateConstraints
      self.view.layoutIfNeeded
    end)
  end

  def button_tapped(sender)
    "http://maps.apple.com/?ll=37.8078,-122.4297&spn=0.01&q=Fort%20Mason,%20San%20Francisco".nsurl.open
  end

  def viewDidLayoutSubviews
    @scroll.contentSize = CGSizeMake(320, 400)
  end
end
