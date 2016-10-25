require './bucket'
require './checkpoint'

def bucket_sort(array)
  #initialize
  buckets = []
  number_of_buckets = Math.sqrt(array.length).floor
  max_size = array.max

  count = 0

  #make buckets
  until count > max_size
    new_bucket = Bucket.new(count, count + 4)
    buckets << new_bucket
    count += 5
  end
  #put stuff in correct bucckets
  array.each do |item|
    buckets.each do |bucket|
      if item >= bucket.min && item <= bucket.max
        bucket.data << item
      end
    end
  end
  #sort individual buckets and add to sorted array
  sorted_array = []
  buckets.each do |bucket|
    sorted_bucket = insertion_sort(bucket.data)
    sorted_array.concat(sorted_bucket)
  end
  sorted_array
end

# test_array = (1..50).to_a.shuffle
# puts bucket_sort(test_array)
