def binary_iterative(array, value)
  low = 0
  high = array.size - 1

  while low <= high
    mid = (low + high) / 2

    if array[mid] > value
      high = mid - 1
    elsif array[mid] < value
      low = mid + 1
    else
      return mid
    end
  end

  return "Value not present."
end
