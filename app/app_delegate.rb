class AppDelegate < PM::Delegate
  attr_accessor :root_vc
  # Color from the ribbon in the logo at http://www.rubymotion.com/conference/2014/
  tint_color Settings.app_color

  def on_load(app, options)
    setup
    appearance

    menu = MenuViewController.new
    menu.current = :talks

    self.root_vc = REFrostedViewController.alloc.initWithContentViewController(InspectNavController.alloc.initWithRootViewController(TalksViewController.new), menuViewController:menu)
    self.root_vc.direction = REFrostedViewControllerDirectionLeft
    self.root_vc.menuViewSize = [(Device.screen.width / 2) + 30, 0]

    open self.root_vc
  end

  def setup
    BW.debug = true unless App.info_plist['AppStoreRelease'] == true

    # 3rd Party integrations
    # Only do this on the device
    if !Device.simulator?
      # Not needed yet
      # app_id = App.info_plist['APP_STORE_ID']

      # Flurry
      NSSetUncaughtExceptionHandler('uncaughtExceptionHandler')
      Flurry.startSession('P7DZ2GH9T4KBCXXT6HGZ')
    end
  end

  def appearance
    UINavigationBar.appearance.titleTextAttributes = { UITextAttributeFont => 'Prada'.uifont(20) }
  end

  def on_activate
    Networking.cache_data
  end

  def show_menu
    self.root_vc.presentMenuViewController
  end

  #Flurry exception handler
  def uncaughtExceptionHandler(exception)
    Flurry.logError("Uncaught", message:"Crash!", exception:exception)
  end

end
