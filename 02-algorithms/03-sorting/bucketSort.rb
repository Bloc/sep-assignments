def bucket_sort(collection)
  no_of_buckets = 10
  buckets = Array.new(no_of_buckets){Array.new}
  divider = ((collection.max + 1)/no_of_buckets).ceil
  divider = 9

  collection.each do |x|
    bucket_number = (x/divider).floor
    buckets[bucket_number] << x
  end

  final_buckets = []
  buckets.each do |array|
    final_buckets << insertion_sort(array) if !array.empty?
  end

  final_buckets.flatten
end


def insertion_sort(collection)
  sorted_collection = [collection.delete_at(0)]
  for val in collection
    sorted_collection_index = 0
    while sorted_collection_index < sorted_collection.length
      if val <= sorted_collection[sorted_collection_index]
        sorted_collection.insert(sorted_collection_index, val)
        break
      elsif sorted_collection_index == sorted_collection.length - 1
        sorted_collection.insert(sorted_collection_index + 1, val)
        break
      end
      sorted_collection_index += 1
    end
  end
  sorted_collection
end
