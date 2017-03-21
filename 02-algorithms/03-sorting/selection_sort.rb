# Selection Sort selects the item which should be sorted "next" and moves it to the front (or back) of the collection. Selection sort has poor performance compared to other sorting algorithms. 

# Best Case: Ω(n^2)
# Worst Case: O(n^2)
# Average Case: Θ(n^2)

def selection_sort(collection)
  length = collection.length

  for i in 0...(length - 1)
    min = i
    for j in (i + 1)...length
      if collection[j] < collection[min]
        min = j
      end
    end

    if min != i
      temp = collection[i]
      collection[i] = collection[min]
      collection[min] = temp
    end
  end
  
  return collection
end

# collection = [5, 8, 1, 6, 4, 3, 0, 7, 9, 2]
# puts selection_sort(collection)