#binary search iterative

def search(list, target)
  low = 0
  high = list.length - 1

  while low <= high
    mid = (high + low)/2
    if target > list[mid]
      low = mid + 1
    elsif target < list[mid]
      high = mid -1
    else
      return mid
    end
  end

  return "couldn't find it"
end


array = [1,2,3,4,5,6,7,8,9,10]

answer = search(array,5)
puts answer
answer = search(array,10)
puts answer
answer = search(array,6)
puts answer
answer = search(array,3)
puts answer
