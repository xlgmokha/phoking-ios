class AddRestaurantCommand
  def initialize(restaurant_name_textbox)
    @textbox = restaurant_name_textbox
  end
  def run(button)
    puts "RUNNING COMMAND"
    #button.disable
    #@textbox.disable
    BW::Location.get do |result|
      BW::Location.stop
      location = Restaurant.new(@textbox.text, result[:to].latitude, result[:to].longitude)
      location.save
    end
  end
end
