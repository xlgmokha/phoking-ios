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
            { title: "Broth", key: :Broth, type: :slider, range: (1..10), value: 7 },
            { title: "Beef", key: :Beef, type: :slider, range: (1..10), value: 7 },
            { title: "Noodles", key: :Noodles, type: :slider, range: (1..10), value: 7 },
            { title: "Vegetables", key: :Vegetables, type: :slider, range: (1..10), value: 7 },
            { title: "Bowl Size", key: :Bowl, type: :slider, range: (1..10), value: 7 },
            { title: "Sauces", key: :Sauces, type: :slider, range: (1..10), value: 7 },
            { title: "Presentation", key: :Presentation, type: :slider, range: (1..10), value: 7 },
            { title: "Ambiance", key: :Ambiance, type: :slider, range: (1..10), value: 7 },
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
        #{:broth=>7, :beef=>7, :noodles=>7, :vegetables=>7, :bowl=>7, :sauces=>7, :presentation=>7.40510940551758, :ambiance=>4.34687423706055}
        BW::HTTP.post("http://localhost:3000/api/v1/reviews", to_hash(form.render) ) do |response|
          #p response
        end
      end
    end

    @form_controller = Formotion::FormController.alloc.initWithForm(@form)
    @window.rootViewController = @form_controller
    @window.makeKeyAndVisible

    true
  end

  def to_hash(hash)
    result = {
      payload:
      {
        review:
        {
          uid: 1,
          latitude: @latitude,
          longitude: @longitude,
          ratings: hash.keys.map { |key| {:score => hash[key], :category => key} }
        }
      }
    }
    p result
    result
  end
end
