def recursive_binary_searcher(array, item)
  if array.include?(item)
    mid_point = (array.length) / 2
    if array[mid_point] == item
      puts "#{item} found"
    elsif array[mid_point] < item
      new_array = array[mid_point..(array.length)].map{|x| x}
      recursive_binary_searcher(new_array,item)
    elsif array[mid_point] > item
      new_array = array[0..mid_point].map{|x| x}
      recursive_binary_searcher(new_array,item)
    end
  else
    puts "Not Found"
  end
end

search_array = [0,1,2,3,4,5,6,7,8,9]
search_array2 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,30,35,42,77,144]

recursive_binary_searcher(search_array, 1)
recursive_binary_searcher(search_array, 4)
recursive_binary_searcher(search_array, 10)
recursive_binary_searcher(search_array2, 11)
recursive_binary_searcher(search_array2, 4)
recursive_binary_searcher(search_array2, 42)
recursive_binary_searcher(search_array2, 77)
recursive_binary_searcher(search_array2, 177)