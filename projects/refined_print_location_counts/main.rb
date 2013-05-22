load '../../environment.rb'
Geocoder::Configuration.timeout = 10

unformatted_counts = @data.network.values.flatten.collect(&:user).collect(&:location).counts
formatted_counts = Hash.new(0)

unformatted_counts.each do |location, count|
  geo = Geocoder.search(location)
  if geo
    formatted_counts[geo] += count
  else
    formatted_counts[location] = count
  end
end