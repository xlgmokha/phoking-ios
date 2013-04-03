class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    #controller_factory = ControllerFactory.new
    #@window.rootViewController = UINavigationController.alloc.initWithRootViewController(controller_factory.create(SearchController))
    #@window.makeKeyAndVisible

    @form = Formotion::Form.new({
      sections: [
        {
          title: "Review",
          rows: [
            { title: "Broth", key: :broth, type: :slider, range: (1..10), value: 7 },
            { title: "Beef", key: :beef, type: :slider, range: (1..10), value: 7 },
            { title: "Noodles", key: :noodles, type: :slider, range: (1..10), value: 7 },
            { title: "Vegetables", key: :vegetables, type: :slider, range: (1..10), value: 7 },
            { title: "Bowl Size", key: :bowl, type: :slider, range: (1..10), value: 7 },
            { title: "Sauces", key: :sauces, type: :slider, range: (1..10), value: 7 },
            { title: "Presentation", key: :presentation, type: :slider, range: (1..10), value: 7 },
            { title: "Ambiance", key: :ambiance, type: :slider, range: (1..10), value: 7 },
          ]
        },
        {
          rows: [ { title: "Submit", type: :submit, }]
        }]
    })
    @form.on_submit do |form|
      BW::Location.get do |result|
        BW::Location.stop
        p form.render
        #location = Restaurant.new(@textbox.text, result[:to].latitude, result[:to].longitude)
        #location.save
      end
    end

    @form_controller = Formotion::FormController.alloc.initWithForm(@form)
    @window.rootViewController = @form_controller
    @window.makeKeyAndVisible

    true
  end
end
