class Button
  def initialize(name)
    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.setTitle(name, forState:UIControlStateNormal)
    @button.setTitle("Loading", forState:UIControlStateDisabled)
    @button.sizeToFit
  end
  def bind_to(command)
    @button.when(UIControlEventTouchUpInside) do
      command.run(@button)
    end
  end
  def disable
    @button.enabled=false
  end
  def add_to(view)
    view.addSubview(@button)
  end
  def control
    @button
  end
end
