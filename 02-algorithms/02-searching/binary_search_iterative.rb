def binary_iterative(collection, target)
  low = 0
  high = collection.length - 1

  while low <= high
    mid = (low + high) / 2
    if collection[mid] > target
      high = mid - 1
    elsif collection[mid] < target
      low = mid + 1
    else
      return "#{target} found at index #{mid}"
    end
  end
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

puts binary_iterative(array, 5)
puts binary_iterative(array, 1)
puts binary_iterative(array, 13)
