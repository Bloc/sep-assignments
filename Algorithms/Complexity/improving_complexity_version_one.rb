# optimized combining arrays

def optimized_written_ruby(*arrays)
  combined_array = arrays.flatten

  sorted_collection = [combined_array.delete_at(0)]

  for val in combined_array
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

arr1 = [5, 10, 20, 44, 3]
arr2 =[21, 31, 19, 14]


optimized_written_ruby(arr1, arr2)
