def iterative_binary_search (collection, value)
  min = 0
  max = collection.length - 1

  while (min <= max)
    mid = (min + max) / 2
    if collection[mid] > value
      max = mid - 1
    elsif collection[mid] < value
      min = mid + 1
    else
      return mid
    end
  end

  return -1
end