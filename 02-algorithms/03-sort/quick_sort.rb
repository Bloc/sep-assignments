# [13, 11, 8, 15, 3, 10]

def quicksort(array)
  return array if array.length <= 1

  pivot_index = (array.length / 2).to_i
  pivot_value = array[pivot_index]

  less = Array.new
  more = Array.new

  array.each do |x|
    if x <= pivot_value
      less << x
    else
      more << x
    end
  end

  return quicksort(less) + [pivot_value] + quicksort(more)
end
