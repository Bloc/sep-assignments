
require_relative 'quick_sort'

def bucket_sort(collection)
  n = collection.length
  bucket_size= 100
  buckets = Array.new(bucket_size)
  for j in 0...bucket_size do
    buckets[j] = 0
  end
  for i in 0...n do
    buckets[collection[i]] += 1
  end
  i = 0
  for j in 0...bucket_size do
    for k in 0...buckets[j]
      collection[i] = j
      i += 1
    end
  end
  collection
end
