# Bucket Sort works by distributing the elements of an array into a number of buckets. Each bucket is then sorted individually, either using a different sorting algorithm, or by recursively applying the bucket sorting algorithm.

# Best Case: Ω(n+k)
# Worst Case: O(n^2)
# Average Case: Θ(n+k)

def bucket_sort(collection)
  buckets = []

  collection.each do |num|
    if buckets[num].nil?
      buckets[num] = []
    end
    buckets[num].push(num)
  end

  sorted = []
  buckets.each do |bucket|
    next if bucket.nil?
    if bucket.length > 1
      bucket = bucket_sort(bucket)
    end
    sorted << bucket
  end

  return sorted
end

# collection = [5, 8, 1, 6, 4, 3, 0, 7, 9, 2]
# puts bucket_sort(collection)