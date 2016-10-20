def binary_search_recursive(collection, value)
  low = 0
  high = collection.length - 1
  mid = (high + low) / 2

  if collection[mid] == value
    return collection[mid]
  elsif collection[mid] < value
    binary_search_recursive(collection.slice(0.. mid -1), value)
  elsif collection[mid] > value
    binary_search_recursive(collection.slice(mid + 1.. high), value)
  end

  return "value not found"
end

collection = [0,5,10,15,20,25,30]

position = binary_search_recursive(collection, 0)
puts position
position = binary_search_recursive(collection, 1)
puts position
position = binary_search_recursive(collection, 10)
puts position
