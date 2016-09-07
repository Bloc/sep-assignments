#binary search recursive

def search(list, target)
  mid = (list.length - 1)/2
  if target > list[mid]
    new_list = list[mid+1..list.length-1]
    search(new_list, target) + (list.length - new_list.length)
  elsif target < list[mid]
    last = [0, mid-1].max
    new_list = list[0..last]
    search(new_list, target)
  else
    return mid
  end
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
