def bin_search_i(item, collection)
	return nil if item.nil?
	return nil if collection.nil?

	x = 0
	y = collection.length-1
	while x <= y do
		mid = ((x + y)/2).to_i
		# puts "mid: #{mid} at #{collection[mid]}"
		return mid if collection[mid] == item
		if collection[mid] < item
			x = mid + 1
		else
			y = mid -1
		end
	end
end

collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "collection: #{collection.to_s}"
puts "Find 9 at index #{bin_search_i(9, collection)}" 
puts "Find 3 at index #{bin_search_i(3, collection)}" 
puts "Find 11 at index #{bin_search_i(11, collection)}" 
