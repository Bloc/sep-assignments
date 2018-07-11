def quick_sort(collection, p, r)
  if p < r
    q = partition(collection, p, r)
    quick_sort(collection, p, q-1)
    quick_sort(collection, q+1, r)
  end
  collection
end


def partition(collection, p, r)
  q = p
  for i in p...r
    if collection[i] <= collection[r]
      swap(collection, q, i)
      q += 1
    end
  end
  swap(collection, r, q)
  q
end

def swap(collection, firstIndex, secondIndex)
  temp = collection[firstIndex];
  collection[firstIndex] = collection[secondIndex];
  collection[secondIndex] = temp;
end

collection = [5, 8, 20, 1, 52, 4, 33, 10]
puts quick_sort(collection, 0, collection.length - 1)
