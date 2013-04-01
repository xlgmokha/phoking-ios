class ReviewController < UIViewController
  def viewDidLoad
    super
    self.title = "Review"
    self.view.backgroundColor = UIColor.whiteColor

    @textbox = Build.textbox([[0,0], [160, 26]]).centered_within(self.view).build
    self.add_control(@textbox)

    button = Build.button("Add Review").centered(CGPointMake(self.view.frame.size.width / 2, @textbox.center.y + 40)).when_clicked(AddReviewCommand.new(@textbox)).build

    add_control(button)
  end

  def add_control(view)
    view.add_to(self.view)
  end

  def bind_to(controller_factory)
    @controller_factory = controller_factory
  end
end
