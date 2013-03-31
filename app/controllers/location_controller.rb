class LocationController < UIViewController
  def viewDidLoad
    super
    self.title = "Location"
    self.view.backgroundColor = UIColor.whiteColor

    @text_field = UITextField.alloc.initWithFrame [[0,0], [160, 26]]
    @text_field.placeholder = ""
    @text_field.textAlignment = UITextAlignmentCenter
    @text_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @text_field.borderStyle = UITextBorderStyleRoundedRect
    @text_field.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 100)
    self.view.addSubview @text_field

    @add = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @add.setTitle("Add Location", forState:UIControlStateNormal)
    @add.setTitle("Loading", forState:UIControlStateDisabled)
    @add.sizeToFit
    @add.center = CGPointMake(self.view.frame.size.width / 2, @text_field.center.y + 40)
    self.view.addSubview @add
    @add.when(UIControlEventTouchUpInside) do
      @add.enabled = false
      @text_field.enabled = false
      p @text_field.text
    end
    end
end
