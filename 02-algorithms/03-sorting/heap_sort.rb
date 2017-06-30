
def heap_sort(collection)
  if collection.length <= 1
    return collection
  else
    heapify(collection)
    ender = (collection.length - 1)
    while ender > 0
      collection[ender], collection[0] = collection[0], collection[ender]
    ender -= 1
    sift_down(collection, 0, ender)
    end
    return collection
  end
end

def heapify(collection)
  start = (collection.length - 2) / 2
  while start >= 0
    sift_down(collection, start, collection.length - 1)
    start -= 1
  end
  collection
end

def sift_down(collection, start, ender)
  root = start
  loop do
    child = root * 2 + 1
    break if child > ender
    if child + 1 <= ender and collection[child] < collection[child + 1]
      child += 1
    end
    if collection[root] < collection[child]
      collection[root], collection[child] = collection[child], collection[root]
      root = child
    else
      break
    end
  end
end
