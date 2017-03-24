# Merge Sort breaks the collection into sub-collections and sorts each sub-collection. Sorted sub-collections are merged together (using recursion) to form larger sorted collections until the entire collection is sorted. Merge sort has good performance compared to other sorting algorithms. 

# Best Case: Ω(nlgn)
# Worst Case: O(nlgn)
# Average Case: Θ(nlgn)

def merge_sort(collection)
  if collection.length <= 1
    return collection
  else
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

# collection = [5, 8, 1, 6, 4, 3, 0, 7, 9, 2]
# puts merge_sort(collection)