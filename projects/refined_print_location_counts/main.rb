load '../../environment.rb'
Geocoder.configure(:lookup => :yandex)

users = @data.network.values.flatten.collect(&:user)
cache = {}

users.each do |user|
  initial = user.location
  
  if cache.has_key?(initial)
    tgeo = cache[initial]
  else
    tgeo = Geocoder.search(initial).first
    cache[initial] = tgeo
  end

  user.geo = tgeo
end

output = users.collect(&:geo).counts.to_json
f = File.new(File.dirname(__FILE__) + '/output/location_counts_refined.json', "w")
f.write(output)
f.close