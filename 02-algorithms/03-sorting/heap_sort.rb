# Heapsort can be thought of as an improved selection sort: like that algorithm, it divides its input into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by extracting the smallest element and moving that to the sorted region. The improvement consists of the use of a heap data structure rather than a linear-time search to find the maximum.

# Best Case: Ω(nlgn)
# Worst Case: O(nlgn)
# Average Case: Θ(nlgn)

require_relative 'node'
require_relative 'min_heap'

def heap_sort(collection)
  sorted_list = []

  root_index = find_root_index(collection)
  root = Node.new(collection.delete_at(root_index))
  sorted_list << root.value
  heap = heapify(collection, root)
  
  (collection.length).times do 
    root_index = find_root_index(collection)
    root = Node.new(collection.delete_at(root_index))
    sorted_list << root.value
  end
  return sorted_list
end

def find_root_index(collection)
  index = 0

  for item in collection
    if item < collection[index]
      index = collection.index(item)
    end
  end
  return index
end

def heapify(collection, root)
  heap = MinBinaryHeap.new(root)

  for item in collection
    node = Node.new(item)
    heap.insert(root, node)
  end
  return heap
end

# collection = [5, 8, 1, 6, 4, 3, 0, 7, 9, 2]
# puts heap_sort(collection)