def heap_sort(collection)
  # need to make a max heap before sorting
  # shift the array and add nil to 0 heap_position
  #collection = collection.unshift(nil)
  buildmaxheap(collection)
  sorted_array = []
  last_element = collection.length-1

  while (collection.length > 0) do
    sorted_array.unshift(collection.shift())
    buildmaxheap(collection)
  end
  return sorted_array
end

def buildmaxheap(collection)
  # the node to start is length/2
  start = (collection.length)/2
  if heapify(collection, start) === false
    buildmaxheap(collection)
  end
  return collection
end

def heapify (collection, start)
    maxheap = true
    index = start
    while (index-1) >= 0 do
      left_child = 2 * index
      right_child = left_child + 1
      # check to see if the children exist
      if (!collection[left_child-1].nil? && !collection[right_child-1].nil?)
        if (collection[left_child-1] >= collection[right_child-1]) && (collection[left_child-1] > collection[index-1])
          # switch with the left child
          collection[index-1], collection[left_child-1] = collection[left_child-1],collection[index-1] 
          maxheap = false
        elsif (collection[right_child-1] > collection[left_child-1]) && (collection[right_child-1] > collection[index-1])
          # switch with the right child
          collection[index-1], collection[right_child-1] = collection[right_child-1], collection[index-1]
          maxheap = false
        end
      elsif collection[left_child-1].nil?
        # compare only right child
        if collection[right_child-1] > collection[index-1]
          collection[index-1], collection[right_child-1] = collection[right_child-1], collection[index-1]
          maxheap = false
        end
      elsif collection[right_child-1].nil?
       # compare only left child
        if collection[left_child-1] > collection[index-1]
          collection[index-1], collection[left_child-1] = collection[left_child-1],collection[index-1]
          maxheap = false
        end
      end
      index -= 1
    end
  return maxheap
end