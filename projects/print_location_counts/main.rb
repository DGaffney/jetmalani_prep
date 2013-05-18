load '../../environment.rb'

output = @data.network.values.flatten.collect(&:user).collect(&:location).counts.to_json
f = File.new(File.dirname(__FILE__) + '/output/location_counts_simple.json', "w")
f.write(output)
f.close