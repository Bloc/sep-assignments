def recursive_binary_search (collection, value, min=0, max=collection.length-1)
  if max < min
    return -1
  end

  mid = (min + max) / 2

  if collection[mid] > value
    recursive_binary_search(collection, value, min, mid-1)
  elsif collection[mid] < value
    recursive_binary_search(collection, value, mid+1, max)
  else
    return mid
  end
end