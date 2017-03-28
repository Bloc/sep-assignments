def bin_search_r(item, collection)
	return "False" if item.nil? || collection.nil? || collection.length == 0
	len = collection.length - 1
	mid = (len/2).to_i
	return "True" if collection[mid] == item

	if collection[mid] < item
		return bin_search_r(item, collection[mid+1..len])
	else
		return bin_search_r(item, collection[0..mid-1])
	end
end

collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "collection: #{collection.to_s}"
puts "Find 9? #{bin_search_r(9, collection)}" 
puts "Find 3? #{bin_search_r(3, collection)}" 
puts "Find 11? #{bin_search_r(11, collection)}" 
