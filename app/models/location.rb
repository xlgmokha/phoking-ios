class Location
  attr_accessor :name, :latitude, :longitude

  def initialize(name, latitude, longitude)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  def save
    begin
      BW::HTTP.post("http://localhost:3000/api/vi/restaurants", payload: {name: @name, latitude: @latitude, longitude: @longitude} ) do |response|
        p response
      end
    rescue Exception => e
      p e
    end
  end
end
