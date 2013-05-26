load '../../environment.rb'

nodes = []
edges = []

account_coordinates = Account.all.inject({}) do |hash, account|
  hash[account.id_str] = account.to_coordinates
  hash
end

Account.all.each do |account|
  a = account.to_coordinates
  nodes << {:coordinates => a}

  account.friends.each do |friend|
    edges << {:source => a, :target => account_coordinates[friend.to_s]}
  end

  account.followers.each do |follower|
    edges << {:source => account_coordinates[follower], :target => a}
  end
end

output = {:nodes => nodes, :edges => edges}.to_json
f = File.new(File.dirname(__FILE__) + '/output/location_superimposed_network_graph.json', "w")
f.write(output)
f.close