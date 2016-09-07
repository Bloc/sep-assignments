module BucketSort
  include InsertionSort

  def self.sort(array, bucket_size = 5)
    if array.empty?
      return
    end

    min_value = array.min
    max_value = array.max

    bucket_count = ((max_value - min_value) / bucket_size).floor + 1
    buckets = Array.new(bucket_count)
    (0..buckets.length - 1).each do |i|
      buckets[i] = []
    end

    (0..array.length - 1).each do |i|
      buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
    end

    array.clear
    (0..buckets.length - 1).each do |i|
      InsertionSort.sort buckets[i]
      buckets[i].each do |value|
        array.push(value)
      end
    end
  end
end
