def quick_sort(collection)
  return [] if collection.empty?
  pivot_point = collection.length-1
  left = []
  right = []
  length = collection.length-1
  final_result = []
  length.times do |x|
    if collection[x] >= collection[pivot_point]
      right << collection[x]
    else collection[x] < collection[pivot_point]
      left << collection[x]
    end
  end
  result = quick_sort(left) , collection[pivot_point] , quick_sort(right)
  final_result = result.flatten
  return final_result
end
