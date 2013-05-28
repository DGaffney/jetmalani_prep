load '../../environment.rb'

nodes = []
edges = []

account_coordinates = Account.all.inject(Hash.new) do |hash, account|
  hash[account.id_str] = account.to_coordinates
  hash
end

Account.all.each do |account|
  a = account.to_coordinates
  nodes << { :coordinates => a }

  edges << account.friends.collect { |friend| { :source => a, :target => account_coordinates[friend.to_s] } }
   
  edges << account.followers.collect { |follower| { :source => account_coordinates[follower], :target => a } }
end

nodes.uniq!

output = { :nodes => nodes, :edges => edges }.to_json
f = File.new(File.dirname(__FILE__) + '../outputs/location_superimposed_network_graph.json', "w")
f.write(output)
f.close