#usage: bundle exec ruby environment.rb
require 'irb'
require 'mongo_mapper'
require 'hashie'
require 'json'
require 'geocoder'
require 'ap'
require_relative '../secrets/keys'

MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017)
MongoMapper.database = "twitter"

Dir[File.dirname(__FILE__) + '/extensions/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

@data = Hashie::Mash[JSON.parse(File.read(File.dirname(__FILE__) + "/input_data/social_network_analysis.json"))]
puts "@data is now a defined variable. Type in @data.class to see that it is a Hashie::Mash."
puts "@data.keys shows the various sets of information that are in this structure."