class MenuViewController < UIViewController
  stylesheet :menu
  attr_accessor :current

  layout :root do
    [:talks, :location, :party, :sponsors, :about].each do |menu|
      subview(UIButton.custom, menu).on(:touch) do
        controller = Object.const_get(menu.to_s.titleize.concat('ViewController')).new
        App.delegate.root_vc.contentViewController = InspectNavController.alloc.initWithRootViewController(controller) unless self.current == menu
        App.delegate.root_vc.hideMenuViewController
        self.current = menu
      end
    end

    subview(UIView, :header) do
      subview(UILabel, :hash)
      subview(UILabel, :title)
    end
  end
end
