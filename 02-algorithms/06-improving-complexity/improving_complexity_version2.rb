# Improving Time Complexity

def time_complexity(*arrays) 
  combined_array = arrays.flatten
  merge_sort(combined_array)
end

def merge_sort(array)
  if array.length <= 1
    return array
  else
    mid = (array.length / 2).floor
    left = merge_sort(array[0..mid - 1])
    right = merge_sort(array[mid..array.length])
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