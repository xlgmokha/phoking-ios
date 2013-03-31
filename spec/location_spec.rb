describe "location" do
  it "should be able to tell me my location" do
    BW::Location.get do |result|
      BW::Location.stop
      p "LOCATION: #{result}"
      p result
      result.should_not be_nil
      #p "From Lat #{result[:from].latitude}, Long #{result[:from].longitude}"
      #p "To Lat #{result[:to].latitude}, Long #{result[:to].longitude}"
    end
  end
end
