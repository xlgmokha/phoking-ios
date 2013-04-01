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
