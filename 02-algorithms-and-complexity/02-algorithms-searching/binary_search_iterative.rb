def binary_search(array, value)
  low = 0
  high = array.length - 1
  while low <= high
    mid = (low + high) / 2
    if array[mid] > value
      high = mid - 1
    elsif array[mid] < value
      low = mid + 1
    else
      return "#{value} is at index #{mid}"
    end
  end
   "#{value} is not in the array"
end

puts binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20], 14)
