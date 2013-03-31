class TextBoxBuilder
  def initialize(coordinates)
    @text_field = UITextField.alloc.initWithFrame(coordinates)
    @text_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @text_field.borderStyle = UITextBorderStyleRoundedRect
  end
  def centered_within(view)
    @text_field.textAlignment = UITextAlignmentCenter
    @text_field.center = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2 - 100)
    self
  end
  def build
    @text_field
  end
end
