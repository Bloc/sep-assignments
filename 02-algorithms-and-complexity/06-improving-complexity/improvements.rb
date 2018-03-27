def improvement_one(*arrays) #code optimizations
  combined_array = []
  arrays.each { |array| combined_array.concat(array) }

  sorted_array = [combined_array.pop]

  for val in combined_array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end

  sorted_array
end

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

# arrays.each iterates over the splt array - O(n)
# The concat method is simply splicing the new array into the original one. - O(n) albiet a differnt n value
# ruby uses a quicksort - O(nlogn)
def improvement_three(*arrays) # further code optimizations / better algorithm
  combined_array = []
  arrays.each { |array| combined_array.concat(array) }
  combined_array.sort
end

# ruby uses a quicksort
# no idea of flatttens efficiency
def improvement_four(*arrays)
  arrays.flatten.sort
end

print "#{improvement_one([8,9,10], [0,1,2], [5,6,7], [3,4,5])} \n"
print "#{improvement_two([8,9,10], [0,1,2], [5,6,7], [3,4,5])} \n"
print "#{improvement_three([8,9,10], [0,1,2], [5,6,7], [3,4,5])} \n"
print "#{improvement_four([8,9,10], [0,1,2], [5,6,7], [3,4,5])} \n"
