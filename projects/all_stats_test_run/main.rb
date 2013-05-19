load '../../environment.rb'

users = @data.network.values.flatten.collect(&:user)
fields = users.inject(Hashie::Mash.new) do |collection, user| 
  user.each {|field, value| (collection[field] ||= []) << value}
  collection
end