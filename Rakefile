# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'

Bundler.setup
Bundler.require

Motion::Project::App.setup do |app|

  app.archs['iPhoneOS'] = ['armv7']
  app.deployment_target = "7.0"

  app.name = 'Inspect 2014'

  app.frameworks += %w{MapKit}

  app.identifier = 'net.epic.RubyMotion'
  app.version = app.short_version = "1.0"

  app.pods do
    pod 'NVSlideMenuController'
  end
  app.vendor_project('vendor/MTLabel', :xcode, :target => 'MTLabel', :headers_dir => 'MTLabel')

  app.prerendered_icon = true
  app.development do
    app.entitlements['get-task-allow'] = true
    app.codesign_certificate = "iPhone Developer: Mark Rickert (YA2VZGDX4S)"
    app.provisioning_profile = "../Provisioning/WildcardDevelopment.mobileprovision"
  end

  app.release do
    app.info_plist['AppStoreRelease'] = true
    app.entitlements['get-task-allow'] = false
    app.codesign_certificate = "iPhone Distribution: Mohawk Apps, LLC (DW9QQZR4ZL)"
    app.provisioning_profile = "./provisioning/release.mobileprovision"
  end
end
