# Bubble Sort passes through a collection multiple times. In each pass, it compares adjacent items and swaps them according to the desired sorting order. The algorithm finishes when there are no swaps done for a complete pass. Bubble sort has poor performance when compared to other sorting algorithms. 

# Best Case: Ω(n)
# Worst Case: O(n^2)
# Average Case: Θ(n^2)

def bubble_sort(collection)
  n = collection.length

  loop do
    swapped = false
    (n - 1).times do |i|
      if collection[i] > collection[i+1]
        temp = collection[i]
        collection[i] = collection[i+1]
        collection[i+1] = temp
        swapped = true
      end
    end
    n -= 1
    break if not swapped
  end

  return collection
end

# collection = [5, 8, 1, 6, 4, 3, 0, 7, 9, 2]
# puts bubble_sort(collection)