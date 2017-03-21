# Quick Sort picks a pivot point and compares each item to the pivot point. It moves each item according to the pivot point. When there are no more items to move in the first iteration, these steps are repeated for the "left" and "right" sides of the collection. Quick sort has good performance compared to other sorting algorithms.

# Best Case: Ω(nlgn)
# Worst Case: O(n^2)
# Average Case: Θ(nlgn)

def quick_sort(collection, min, max)
  if min < max
    index = partition(collection, min, max)
    quick_sort(collection, min, index-1)
    quick_sort(collection, index+1, max)
  end
  return collection
end

def partition(collection, left, right)
  pivot = collection[right]
  index = left
  for i in (left...right)
    if collection[i] <= pivot
      temp = collection[i]
      collection[i] = collection[index]
      collection[index] = temp
      index += 1
    end
  end
  temp = collection[index]
  collection[index] = collection[right]
  collection[right] = temp
  return index
end

# collection = [5, 8, 1, 6, 4, 3, 0, 7, 9, 2]
# puts quick_sort(collection, 0, collection.length-1)