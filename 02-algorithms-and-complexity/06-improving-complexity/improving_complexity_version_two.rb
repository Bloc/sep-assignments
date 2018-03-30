def improvement_two(*arrays) # more efficient sorting algorithm - merge sort
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

  combined_array = []
  arrays.each { |array| combined_array.concat(array) }
  merge_sort(combined_array)
end

print "#{improvement_two([8,9,10], [0,1,2], [5,6,7], [3,4,5])} \n"
