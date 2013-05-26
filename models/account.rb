class Account
  include MongoMapper::Document
  include Geocoder::Model::MongoMapper

  key :id_str, String
  key :name, String
  key :location, String
  key :screen_name, String
  key :coordinates, Array
  key :friends, Array
  key :followers, Array

  geocoded_by :location
  after_validation :geocode
end