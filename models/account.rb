class Account
  include MongoMapper::Document

  key :id_str, String
  key :name, String
  key :location, String
  key :screen_name, String
  key :friends, Array
  key :followers, Array
  key :coordinates, Array

  include Geocoder::Model::MongoMapper
  geocoded_by :location
  after_validation :geocode
end