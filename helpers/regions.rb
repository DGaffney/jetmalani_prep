load '../environment.rb'

sets = Account.all.collect do |account|
  next if account.geocoded? == false
  Account.near(account, 30).all.collect(&:id_str)
end

sets.compact!.combinate

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