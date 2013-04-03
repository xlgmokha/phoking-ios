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
            { title: "Broth", key: :slider, type: :slider, range: (1..10), value: 7 },
            { title: "Beef", key: :slider, type: :slider, range: (1..10), value: 7 },
            { title: "Noodles", key: :slider, type: :slider, range: (1..10), value: 7 },
            { title: "Vegetables", key: :slider, type: :slider, range: (1..10), value: 7 },
            { title: "Bowl Size", key: :slider, type: :slider, range: (1..10), value: 7 },
            { title: "Sauces", key: :slider, type: :slider, range: (1..10), value: 7 },
            { title: "Presentation", key: :slider, type: :slider, range: (1..10), value: 7 },
            { title: "Ambiance", key: :slider, type: :slider, range: (1..10), value: 7 },
          ]
        },
        {
          rows: [ { title: "Submit", type: :submit, }]
        }]
    })

    @form_controller = Formotion::FormController.alloc.initWithForm(@form)
    @window.rootViewController = @form_controller
    @window.makeKeyAndVisible

    true
  end
end
