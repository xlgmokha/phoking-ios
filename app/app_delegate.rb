class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    begin
      BW::Location.get do |result|
        p "LOCATION: #{result}"
        p result
        #p "From Lat #{result[:from].latitude}, Long #{result[:from].longitude}"
        #p "To Lat #{result[:to].latitude}, Long #{result[:to].longitude}"
      end
    rescue Exception => e
      p e
    end

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @location_controller = RestaurantController.alloc.initWithNibName(nil, bundle:nil)
    @navigation_controller = UINavigationController.alloc.initWithRootViewController(@location_controller)

    @window.rootViewController = @navigation_controller
    @window.makeKeyAndVisible
    true
  end
end
