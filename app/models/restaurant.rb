class Restaurant
  attr_accessor :name, :latitude, :longitude

  def initialize(name, latitude, longitude)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  def save
    begin
      BW::HTTP.post("http://localhost:3000/api/v1/restaurants", to_hash ) do |response|
        begin
          p response
        rescue Exception => e
          p e
        end
      end
    rescue Exception => e
      p e
    end
  end

  def to_hash
    {
      payload:
      {
        restaurant:
        {
          name: @name,
          latitude: @latitude,
          longitude: @longitude
        }
      }
    }
  end
end
