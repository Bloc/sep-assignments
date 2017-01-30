# Saves space by utilizing sorting algorithms based on size of array

def timecomplex_written_ruby(*arrays)
  return nil if arrays.empty?
  combined_array = arrays.flatten

  if combined_array.length < 20
    linear_sort(combined_array)
  elsif combined_array.length > 20 && combined_array.length < 800
    bubble_sort(combined_array)
  else
    merge_sort(combined_array)
  end

end

private

def linear_sort(array)
  sorted_collection = [array.delete_at(0)]

  for val in array
    sorted_collection_index = 0

    while sorted_collection_index < sorted_collection.length
      if val <= sorted_collection[sorted_collection_index]
       sorted_collection.insert(sorted_collection_index, val)
       break
      elsif sorted_collection_index == sorted_collection.length - 1
       sorted_collection.insert(sorted_collection_index + 1, val)
       break
      end

      sorted_collection_index += 1
    end
  end

  sorted_collection
end

def bubble_sort(array)
 n = array.length
 begin
   swapped = false

    (n - 1).times do |i|
      if array[i] > array[i + 1]
        tmp = array[i]
        array[i] = array[i + 1]
        array[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  array
end


def merge_sort(collection)
  if collection.length <= 1
    collection
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

arr1 = [5, 10, 20, 44, 3, 65, 28, 78, 114, 32, 73, 81, 90]
arr2 =[21, 31, 19, 14, 89, 100, 2, 6, 34]
