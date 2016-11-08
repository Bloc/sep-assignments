require_relative './node'
require_relative './linked_list'

def space_optimized_ruby(*arrays)
  #create linked list from arrays
  list = LinkedList.new()
  arrays.each do |array|
    array.each do |item|
      list.insert(item)
    end
  end

  #build sorted array from linked list
  sorted_array = []
  until list.head.nil?
    smallest = list.find_remove_smallest()
    sorted_array << smallest
  end

  sorted_array
end

# array1 = []
# array2 = []
# array3 = []
#
# 5.times do |x|
#   array1 << rand(100)
#   array2 << rand(100)
#   array3 << rand(100)
# end
#
# x = space_optimized_ruby(array1, array2, array3)
# puts x
