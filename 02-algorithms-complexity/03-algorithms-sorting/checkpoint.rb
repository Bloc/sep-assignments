def insertion_sort(collection)
  sorted_collection = [collection.delete_at(0)]

  for val in collection
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

def selection_sort(collection)
  length = collection.length
  for i in 0..length - 2
    min_index = i
    for j in (i + 1)...length
      if collection[j] < collection[min_index]
        min_index = j
      end
    end

    tmp = collection[i]
    collection[i] = collection[min_index]
    collection[min_index] = tmp
  end
  collection
end

def bubble_sort(collection)
  n = collection.length
  begin
    swapped = false

    (n - 1).times do |i|
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  collection
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
