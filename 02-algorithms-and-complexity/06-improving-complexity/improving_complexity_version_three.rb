# arrays.each iterates over the splt array - O(n)
# The concat method is simply splicing the new array into the original one. - O(n) albiet a differnt n value
# ruby uses a quicksort - O(nlogn)
def improvement_three(*arrays) # further code optimizations / better algorithm
  combined_array = []
  arrays.each { |array| combined_array.concat(array) }
  combined_array.sort
end

print "#{improvement_three([8,9,10], [0,1,2], [5,6,7], [3,4,5])} \n"
