def insertion_sort(array)
   sorted_array = [array.delete_at(0)]

   array.each do |item|
     sorted_array_index = 0
     while sorted_array_index < sorted_array.length
       if item <= sorted_array[sorted_array_index]
         sorted_array.insert(sorted_array_index, item)
         break
       elsif sorted_array_index == sorted_array.length - 1
         sorted_array.insert(sorted_array_index + 1, item)
         break
       end
       sorted_array_index += 1
     end
   end

  #return the sorted array
  sorted_array
 end

def bucket_sort(arr, n=5)
  #create n empty buckets
  buckets = Array.new(n) { Array.new }

  max = arr.max
  divider = ((max.to_f + 1) / n).ceil

  #for each element in arr -> insert element into a bucket
  arr.each do |item|
    index = (item / divider).floor
    buckets[index].push(item)
  end

  # sort each individual bucket with insertion sort
  buckets.map! do |array|
    array.length > 1 ? insertion_sort(array) : array
  end

  #concat all sorted buckets
  buckets.flatten
end
