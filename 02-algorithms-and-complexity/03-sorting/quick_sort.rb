# Swaps two items in an array, changing the original array
def swap(arr, first, second)
  temp = arr[first]
  arr[first] = arr[second]
  arr[second] = temp
end

# Partitions array with values less than pivot value to the left of the pivot_index and items greater to the right of the pivot_index. Returns the pivot_index.
def partition(arr, first, last)
  pivot_value = arr[last]
  pivot_index = first

  i = first
  while i < last
    if arr[i] <= pivot_value
      swap(arr, i, pivot_index)
      pivot_index += 1
    end
    i += 1
  end

  swap(arr, pivot_index, last)
  return pivot_index
end

# Calls recursive quicksort on partitioned array
def quicksort(arr, first, last)
  if first < last
    pivot_index = partition(arr, first, last)
    quicksort(arr, first, pivot_index - 1)
    quicksort(arr, pivot_index + 1, last)
  end
end
