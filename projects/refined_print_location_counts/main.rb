load '../../environment.rb'
Geocoder.configure(:lookup => :google, :timeout => 3)

users = @data.network.values.flatten.collect(&:user)
geocache = {}

antarctica = Geocoder.search('antarctica')

users.each do |user|
  loc = user.location.to_s

  if loc.empty?
    user.geo = antarctica
    next
  end

  if geocache.has_key?(loc)
    user.geo = geocache[loc]
  else
    sleep 1
    geocache[loc] = Geocoder.search(loc)
    user.geo = geocache[loc]
    print "#{loc}\n"
  end
end

output = users.collect(&:geo).counts.to_json
f = File.new(File.dirname(__FILE__) + '../outputs/location_counts_refined.json', "w")
f.write(output)
f.close

u = users.to_json
g = File.new(File.dirname(__FILE__) + '/output/geousers.json', "w")
g.write(u)
g.close