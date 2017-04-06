# Improving Code Optimization

def optimized_sort(*arrays)
  combined_array = []
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end

  sorted_array = [combined_array.delete_at(-1)]

  for val in combined_array
    length = sorted_array.length
    for i in (0...length)
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