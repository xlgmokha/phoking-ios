class Build
  def self.textbox(coordinates)
    TextBoxBuilder.new(coordinates)
  end
  def self.button(name)
    ButtonBuilder.new(name)
  end
end
