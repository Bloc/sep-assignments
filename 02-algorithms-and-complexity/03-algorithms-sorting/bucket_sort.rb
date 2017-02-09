class BucketArray
  def print
    puts @bucket_array.to_s
  end

  def read_file(filename)
    @bucket_array = File.readlines(filename)
    @bucket_array.map! { |x| x.strip.to_i }
  end

  def bucket_sort
    n = @bucket_array.length-1
    m = 100
    buckets = Array.new(m)
    for j in 0...m do
      buckets[j] = 0
    end
    for i in 0...n do
      buckets[@bucket_array[i]] += 1
    end
    i = 0
    for j in 0...m do
      for k in 0...buckets[j]
        @bucket_array[i] = j
        i += 1
      end
    end
    @bucket_array
  end

end