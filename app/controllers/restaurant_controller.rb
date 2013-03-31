class RestaurantController < UIViewController
  def viewDidLoad
    super
    self.title = "Restaurant"
    self.view.backgroundColor = UIColor.whiteColor

    @text_field = Build.text_field([[0,0], [160, 26]]).centered_within(self.view).build
    self.addView(@text_field)

    @add = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @add.setTitle("Add Restaurant", forState:UIControlStateNormal)
    @add.setTitle("Loading", forState:UIControlStateDisabled)
    @add.sizeToFit
    @add.center = CGPointMake(self.view.frame.size.width / 2, @text_field.center.y + 40)
    self.view.addSubview @add
    @add.when(UIControlEventTouchUpInside) do
      begin
        @add.enabled = false
        @text_field.enabled = false
        BW::Location.get do |result|
          BW::Location.stop
          location = Restaurant.new(@text_field.text, result[:to].latitude, result[:to].longitude)
          location.save
        end
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end
    end
  end

  def addView(view)
    self.view.addSubview(view)
  end
end
