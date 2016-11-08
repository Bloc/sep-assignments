def code_optimized_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    ## replace nested loop w/ single line to combine each array into combined_array
    combined_array.concat(array)
  end

  #shortned creation of initial sorted_array
  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  for val in combined_array
    i = 0
    not_inserted = true
    while i < sorted_array.length-1
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        not_inserted = false
        break
      end
      i+=1
    end
    if not_inserted
      sorted_array.push(val)
    end
  end

  sorted_array
end

# array1 = []
# array2 = []
# array3 = []
#
# 5.times do |x|
#    array1 << rand(100)
#    array2 << rand(100)
#    array3 << rand(100)
#  end
#
#  x = code_optimized_ruby(array1, array2, array3)
#  puts x
