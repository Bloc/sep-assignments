def binary_search(array, value)
  low = 0
  high = array.length - 1
  return false if low > high
  mid = (low + high) / 2
  if array[mid] == value
    true
  elsif array[mid] > value
    binary_search(array[low..(mid - 1)], value)
  else
    binary_search(array[(mid + 1)..high], value)
  end
end

puts binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20], 15)
