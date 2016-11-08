def input_to_iterations_linear(array)
	# Big-O for linear search is O(n)
	for i in array
		puts "#{i}, #{i}"
	end
end

array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

input_to_iterations_linear(array)
