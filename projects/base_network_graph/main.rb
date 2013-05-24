load '../../environment.rb'

nodes = []
edges = []

Account.all.each do |account|
  node = {:id => account.id_str, :label => account.screen_name}
  nodes << node

  account.friends.each do |friend|
    edge = {:source => account.id_str, :target => friend.to_s}
    edges << edge
  end

  account.followers.each do |follower|
    edge = {:source => follower, :target => account.id_str}
    edges << edge
  end
end

edges.uniq!

output = {:nodes => nodes, :edges => edges}.to_json
f = File.new(File.dirname(__FILE__) + '/output/base_network_graph.json', "w")
f.write(output)
f.close