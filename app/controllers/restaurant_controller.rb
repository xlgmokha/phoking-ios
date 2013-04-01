class RestaurantController < UIViewController
  def viewDidLoad
    super
    self.title = "Restaurant"
    self.view.backgroundColor = UIColor.whiteColor

    @textbox = Build.textbox([[0,0], [160, 26]]).centered_within(self.view).build
    self.add_control(@textbox)

    command = AddRestaurantCommand.new(@textbox)
    button = Build
      .button("Add Restaurant")
      .centered(CGPointMake(self.view.frame.size.width / 2, @textbox.center.y + 40))
      .when_clicked(command)
      .build

    add_control(button)
  end

  def add_control(view)
    view.add_to(self.view)
  end

  def bind_to(controller_factory)
    @controller_factory = controller_factory
  end
end
