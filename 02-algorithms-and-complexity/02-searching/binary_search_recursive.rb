def binary_recursive(array, low, high, value)
  mid = (low + high) / 2

  if low <= high
    if array[mid] > value
     binary_recursive(array, 0, mid - 1, value)
    elsif array[mid] < value
      binary_recursive(array, mid + 1, array.size - 1, value)
    else
      mid
    end
  else
    "Value not present."
  end
end
