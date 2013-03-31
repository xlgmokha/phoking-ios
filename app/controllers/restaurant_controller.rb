class RestaurantController < UIViewController
  def viewDidLoad
    super
    self.title = "Restaurant"
    self.view.backgroundColor = UIColor.whiteColor

    @textbox = Build.textbox([[0,0], [160, 26]]).centered_within(self.view).build
    self.add_control(@textbox)

    @add = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @add.setTitle("Add Restaurant", forState:UIControlStateNormal)
    @add.setTitle("Loading", forState:UIControlStateDisabled)
    @add.sizeToFit
    @add.center = CGPointMake(self.view.frame.size.width / 2, @textbox.center.y + 40)
    self.view.addSubview @add
    @add.when(UIControlEventTouchUpInside) do
      begin
        @add.enabled = false
        @textbox.disable
        BW::Location.get do |result|
          BW::Location.stop
          location = Restaurant.new(@textbox.text, result[:to].latitude, result[:to].longitude)
          location.save
        end
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end
    end
  end

  def add_control(view)
    view.add_to(self.view)
  end
end
