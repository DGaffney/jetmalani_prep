load '../environment.rb'

sets = Account.all.collect do |account|
  next if account.geocoded? == false
  Account.near(account, 30).all.collect(&:id_str)
end

clusters = sets.compact!.combinate

regions = clusters.collect do |cluster|
  points = cluster.collect { |id| Account.find_by_id_str(id).to_coordinates }
  coordinates = Geocoder::Calculations.geographic_center(points)
  geo = Geocoder.search(coordinates)
  sleep 0.5
  region = {
    :coordinates => coordinates,
    :country => geo.first.country,
    :state => geo.first.state,
    :city => geo.first.city,
    :address => geo.first.address,
    :count => points.count,
    :accounts => cluster
  }
end

# made array method for array of arrays:
# it checks for intersections among the 
# sub-arrays and combines them if found. 
# it then takes the new combined 
# sub-array and checks for intersections 
# again. repeat until no longer growing 
# and move on to the next subarray.

# since 'sets' contains arrays of the 
# ids of accounts nearby a given account,
# performing 'combinate!' on the 
# superset returns an array of arrays of 
# ids where the distance between one 
# account and at least one other is less 
# than the distance parameter (in this 
# case, 30 miles).