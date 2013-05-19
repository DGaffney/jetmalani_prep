load '../../environment.rb'
Geocoder.configure(:lookup => :bing, :api_key => BingKey::BING_IT)

l_s_counts = @data.network.values.flatten.collect(&:user).collect(&:location).counts