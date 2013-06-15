load '../environment.rb'

features = Account.all.collect do |account|
  next if account.geocoded? == false
  {
    "type" => "Feature",
    "geometry" => { "type" => "Point", "coordinates" => account.to_coordinates },
    "properties" => { "id_str" => account.id_str, "name" => account.name, "location" => account.location, "screen_name" => account.screen_name}
  }
end

features.compact!

output = {"type" => "FeatureCollection", "features" => features }.to_json
f = File.new(File.dirname(__FILE__) + '/test.geojson', "w")
f.write(output)
f.close