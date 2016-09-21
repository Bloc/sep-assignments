 def poorly_written_ruby(*arrays)
   combined_array = [0]
   (1..arrays.length - 1).each do |i|
       combined_array.concat(arrays[i])
     end
     combined_array.sort!
   end
