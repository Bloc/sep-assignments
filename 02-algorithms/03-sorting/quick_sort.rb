def quick_sort(collection)
  if collection.length <= 1
    return collection
  else
    # Set pivot point to last item in array
    pivot = collection.last
    left = []
    right =[]
    collection.pop
    collection.each do |x|
      # Compare each item to the pivot point
      # If the item is greater than the pivot point then it is moved to the right of the pivot point. The item at the pivot points shifts one index to the left
      x <= pivot ? left.push(x) : right.push(x)
    end
    # After all items that are greater than pivot point have been moved, quick sort recursively applies the previous step to the left and right sides of the collection
    return quick_sort(left) + [pivot] + quick_sort(right)
  end
end
