class Build
  def self.textbox(coordinates)
    TextBoxBuilder.new(coordinates)
  end
  def self.button(name)
    ButtonBuilder.new(name)
  end
end

class ButtonBuilder
  def initialize(name)
    @button = Button.new(name)
  end
  def centered(coordinates)
    @button.control.center = coordinates
    self
  end
  def when_clicked(command)
    @button.bind_to(command)
    self
  end
  def build
    @button
  end
end

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
