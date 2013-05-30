load '../../environment.rb'

users = @data.network.values.flatten.collect(&:user)
fields = users.inject(Hashie::Mash.new) do |collection, user| 
  user.each { |field, value| (collection[field] ||= []) << value }
  collection
end

stats = fields.keep_if { |key, arr| arr.first.is_a? Numeric }
output = stats.update(stats) { |key, arr| arr.all_stats }.to_json
f = File.new(File.dirname(__FILE__) + '/output/all_stats_test_run.json', "w")
f.write(output)
f.close
