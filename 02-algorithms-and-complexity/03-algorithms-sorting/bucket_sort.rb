require_relative 'insertion_sort'

def bucket_sort(collection, bucket_size = 5)
  return if collection.empty?

  min_value = collection.min
  max_value = collection.max

  # Initialise buckets -- This implementation utilizes a 2D array. We could also
  # use a linked list.
  bucket_count = ((max_value - min_value) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)
  (0...buckets.length).each do |i|
    buckets[i] = []
  end

  # Distribute input array values into buckets
  (0...collection.length).each do |i|
    buckets[((collection[i] - min_value) / bucket_size).floor].push(collection[i])
  end

  # Sort buckets with insertion sort and place items back into input array
  collection.clear
  (0...buckets.length).each do |i|
    buckets[i] = insertion_sort(buckets[i])
    buckets[i].each  do |item|
      collection.push(item)
    end
  end
  collection
end
