def time_optimized_ruby_rs(*arrays)
  combined_array = []
  arrays.each do |array|
    #replace nested loop w/ single line to combine each array into combined_array
    combined_array.concat(array)
  end

  sorted_array = combined_array.sort
  sorted_array
end

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
# x = time_optimized_ruby_rs(array1, array2, array3)
# puts x
