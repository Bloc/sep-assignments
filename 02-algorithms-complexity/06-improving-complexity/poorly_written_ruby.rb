# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end

  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  for val in combined_array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array.insert(i, val)
        break
      end
      i+=1
    end
  end

  # Return the sorted array
  sorted_array
end
# 
# array1 = []
# array2 = []
# array3 = []
#
# 5.times do |x|
#   array1 << rand(100)
#   array2 << rand(100)
#   array3 << rand(100)
# end
#
# x = poorly_written_ruby(array1, array2, array3)
# puts x
