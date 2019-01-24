def iterative_binary_searcher(array, item)
 low = 0
 high = array.length - 1

 while low <= high
   mid = (low + high) / 2
   if array[mid] > item
     high = mid - 1
   elsif array[mid] < item
     low = mid + 1
   else
     return puts "Found #{item}"
   end
 end
end

search_array = [0,1,2,3,4,5,6,7,8,9]
search_array2 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,30,35,42,77,144]

iterative_binary_searcher(search_array, 1)
iterative_binary_searcher(search_array, 4)
iterative_binary_searcher(search_array, 10)
iterative_binary_searcher(search_array2, 11)
iterative_binary_searcher(search_array2, 4)
iterative_binary_searcher(search_array2, 42)
iterative_binary_searcher(search_array2, 77)
iterative_binary_searcher(search_array2, 177)