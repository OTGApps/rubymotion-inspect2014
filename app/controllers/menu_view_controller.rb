class RMIMenuViewController < UIViewController
  stylesheet :menu
  attr_accessor :current

  layout :root do
    subview(UIButton.custom, :talks).on(:touch) do
      App.delegate.root_vc.contentViewController = InspectNavController.alloc.initWithRootViewController(RMIScheduleViewController.alloc.init(:talks)) unless self.current == :talks
      App.delegate.root_vc.hideMenuViewController
      self.current = :talks
    end

    subview(UIButton.custom, :location).on(:touch) do
      App.delegate.root_vc.contentViewController = InspectNavController.alloc.initWithRootViewController(RMILocationViewController.new) unless self.current == :location
      App.delegate.root_vc.hideMenuViewController
      self.current = :location
    end

    subview(UIButton.custom, :party).on(:touch) do
      App.delegate.root_vc.contentViewController = InspectNavController.alloc.initWithRootViewController(RMIPartyViewController.new) unless self.current == :party
      App.delegate.root_vc.hideMenuViewController
      self.current = :party
    end

    subview(UIView, :header) do
      subview(UILabel, :hash)
      subview(UILabel, :title)
    end

    subview(UIButton.custom, :sponsors).on(:touch) do
      App.delegate.root_vc.contentViewController = InspectNavController.alloc.initWithRootViewController(RMISponsorsViewController.new) unless self.current == :sponsors
      App.delegate.root_vc.hideMenuViewController
      self.current = :sponsors
    end

    subview(UIButton.custom, :about).on(:touch) do
      App.delegate.root_vc.contentViewController = InspectNavController.alloc.initWithRootViewController(RMIAboutViewController.new) unless self.current == :about
      App.delegate.root_vc.hideMenuViewController
      self.current = :about
    end
  end
end
