require 'benchmark'

def heap_sort(collection)
  #heapify
	for i in 1...collection.length
    #move up
    child = i
		while child > 0
      parent = (child - 1) / 2
			if collection[parent] < collection[child]
				collection[parent], collection[child] = collection[child], collection[parent]
				child = parent
			else
				break
			end
		end
  end

  #sort
	i = collection.length - 1
	while i > 0
		collection[0], collection[i] = collection[i], collection[0]
		i -= 1

		#move down
		parent = 0
		while parent * 2 + 1 <= i
			child = parent * 2 + 1
			if child < i && collection[child] < collection[child + 1]
				child += 1
			end
			if collection[parent] < collection[child]
				collection[parent], collection[child] = collection[child], collection[parent]
				parent = child
			else
				break
			end
		end
	end
  collection
end
