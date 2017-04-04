# Improving Space Complexity

def space_complexity(*arrays)
  arrays.flatten
  sorted_array = [arrays.delete_at(-1)]

  for val in arrays
    length = sorted_array.length
    length.times do |i|
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == length - 1
        sorted_array << val
        break
      end
    end
  end
    
  return sorted_array
end