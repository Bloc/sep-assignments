def quick_sort(array)
  #pick pivot point
  pivot = array.last - 1

  small_array =

  big_array =
  #compare each item to pivot point
  #loop through array
    #create two new arrays
      #if greater than pivot point then move to right
        #smaller array = less than pivot
        #bigger array = greater than pivot
    # call quick_sort again on each small and big array
    #if greater than pivot point then move to right

  #return sorted array
  return array
end
