class TextBox
  def initialize(text_field)
    @text_field = text_field
  end

  def center
    @text_field.center
  end

  def disable
    @text_field.enabled = false
  end

  def text
    @text_field.text
  end

  def add_to(view)
    view.addSubview(@text_field)
  end
end
