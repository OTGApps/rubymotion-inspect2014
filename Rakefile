# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.name = 'Inspect 2014'
  app.deployment_target = '7.0'
  app.frameworks += %w{MapKit}
  app.identifier = 'com.mohawkapps.inspect'
  app.version = '1'
  app.short_version = '1.0.0'
  app.icons = Dir.glob("resources/Icon*.png").map{|icon| icon.split("/").last}
  app.prerendered_icon = true

  app.pods do
    pod 'REFrostedViewController'
    pod 'FlurrySDK'
  end
  app.vendor_project('vendor/MTLabel', :xcode, :target => 'MTLabel', :headers_dir => 'MTLabel')

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
