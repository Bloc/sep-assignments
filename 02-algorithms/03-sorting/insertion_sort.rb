# Insertion Sort moves items from an unsorted collection to a new, sorted collection by inserting items in their proper place one at a time. This algorithm has poor performance compared to other sorting algorithms. 

# Best Case: Ω(n)
# Worst Case: O(n^2)
# Average Case: Θ(n^2)

def insertion_sort(collection)
  sorted = [collection.delete_at(0)]

  for value in collection
    index = 0
    while index < sorted.length
      if value <= sorted[index]
        sorted.insert(index, value)
        break
      elsif index == sorted.length - 1
        sorted.insert(index + 1, value)
        break
      end
      index += 1
    end
  end

  return sorted
end

# collection = [5, 8, 1, 6, 4, 3, 0, 7, 9, 2]
# puts insertion_sort(collection)