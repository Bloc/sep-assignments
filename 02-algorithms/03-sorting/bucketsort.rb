def bucketsort(array)
  buckets = Array.new(array.length)

  array.each do |value|
    bucket = Math.sqrt(array.length).floor
    if buckets[bucket] == nil
      buckets[bucket] = Array.new
      buckets[bucket].push(value)
    else
      buckets[bucket].push(value)
    end
  end

  buckets.each_index do |index|
    if buckets[index] != nil
      buckets[index] = insertion_sort(buckets[index])
    end
  end
  return buckets.flatten.compact
end

def insertion_sort(array)
  sort_array = [array[0]]
  array.delete_at(0)

  for val in array
    index = 0
    while index < sort_array.length
      if val <= sort_array[index]
        sort_array.insert(index, val)
        break
      elsif index == sort_array.length - 1
        sort_array.insert((index + 1), val)
        break
      end
      index += 1
    end
  end
  return sort_array
end


array = [9, 21, 10, 4, 76, 100]

puts bucketsort(array)

# require 'benchmark'
#
# puts "The bucket sort speed is:"
# puts Benchmark.measure {
#    bucketsort(array)
# }
