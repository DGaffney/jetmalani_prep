load '../environment.rb'
Geocoder::Configuration.cache = Hash.new

@data.network.values.flatten.collect(&:user).each do |user|
  a = Account.new
  a.id_str = user.id_str
  a.name = user.name
  a.screen_name = user.screen_name
  a.friends = @data.friend_ids[user.id_str]
  a.followers = @data.follower_ids[user.id_str]

  if user.location && user.location.length > 0
    a.location = user.location
  else
    a.location = "the North pole"
  end

  a.save
  print "#{a.name} :  #{a.location} :  #{a.coordinates}\n"

  sleep 0.5
end