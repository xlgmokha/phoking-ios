class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    controller_factory = ControllerFactory.new
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(controller_factory.create(SearchController))
    @window.makeKeyAndVisible
    true
  end
end
