# -*- encoding : utf-8 -*-
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    setup

    menu = RMIMenuViewController.new
    menu.current = :talks
    talks = RMITalksController.new

    UINavigationBar.appearance.titleTextAttributes = { UITextAttributeFont => 'Cassannet Regular'.uifont(20) }

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    root = NVSlideMenuController.alloc.initWithMenuViewController(menu, andContentViewController: talks)
    #root.panGestureEnabled = false
    @window.rootViewController = root
    @window.makeKeyAndVisible
    true
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

  def applicationDidBecomeActive(application)
    cache_talks
  end

  def cache_talks
    AFMotion::HTTP.get("http://rubymotion.com/conference/talks.plist", q: Time.now.to_i) do |result|
      if result && result.body
        path = "talks.plist".document_path
        path.remove_file! if path.file_exists?
        NSFileManager.defaultManager.createFileAtPath(path, contents: result.body, attributes: nil)
        "talks_cached".post_notification
      end
    end
  end

  #Flurry exception handler
  def uncaughtExceptionHandler(exception)
    Flurry.logError("Uncaught", message:"Crash!", exception:exception)
  end

end
