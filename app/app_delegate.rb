class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(SearchController.alloc.initWithNibName(nil, bundle:nil))
    @window.makeKeyAndVisible
    true
  end
end
