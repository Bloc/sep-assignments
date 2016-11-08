def binary_search_recursive(collection, value)
  high = collection.length - 1
  low = 0
  mid = (high + low) / 2

  if collection.empty?
    return "value not found"
  elsif collection[mid] == value
    return collection[mid]
  elsif collection[mid] < value
    binary_search_recursive(collection.slice(mid + 1..high), value)
  elsif collection[mid] > value
    binary_search_recursive(collection.slice(0..mid - 1), value)
  end
end

collection = [0,5,10,15,20,25,30]

position = binary_search_recursive(collection, 15)
puts position
position = binary_search_recursive(collection, 1)
puts position
position = binary_search_recursive(collection, 10)
puts position
position = binary_search_recursive(collection, 30)
puts position
position = binary_search_recursive(collection, 35)
puts position
