def binary_recursion(collection, target)
  if collection.include?(target)
    mid = collection.length / 2
    low = collection.slice(0, mid)
    high = collection.slice(mid, collection.length)
    if collection[mid] == target
      return "#{target} found"
    elsif collection[mid] > target
      binary_recursion(low, target)
    elsif collection[mid] < target
      binary_recursion(high, target)
    end
  else
    return "#{target} not available"
  end
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

puts binary_recursion(array, 5)
puts binary_recursion(array, 1)
puts binary_recursion(array, 13)
puts binary_recursion(array, 15)
