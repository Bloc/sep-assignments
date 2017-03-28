# This method takes n arrays as input and combine them in sorted ascending  order
 def poorly_written_ruby(*arrays)
   combined_array = []
   arrays.each do |array|
     array.each do |value|
       combined_array << value
     end
   end

   puts combined_array.to_s
   sorted_array = [combined_array.delete_at(combined_array.length-1)]
   puts sorted_array.to_s
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

a = [1, 5, 9]
b = [2, 7, 8]
c = [4, 6, 3]
puts poorly_written_ruby(a, b, c).to_s
