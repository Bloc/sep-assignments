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

print "#{improvement_one([8,9,10], [0,1,2], [5,6,7], [3,4,5])} \n"
