class QuickArray
  def print
    puts @quick_array.to_s
  end
  
  def read_file(filename)
    @quick_array = File.readlines(filename)
    @quick_array.map! { |x| x.strip }
  end

  def quick_sort
    self.sort_helper(0, @quick_array.length-1)
    @quick_array
  end

  def sort_helper(first, last)
    if first < last
      split_point = partition(first, last)

      sort_helper(first, split_point-1)
      sort_helper(split_point+1, last)
    end
  end

  def partition(first, last)
    pivot_value = @quick_array[last]
    less = []
    more = []
    for i in first..last-1 do
      if pivot_value < @quick_array[i]
        more << @quick_array[i]
      else
        less << @quick_array[i]
      end
    end
    @quick_array[first..last] = (less + [pivot_value] + more)
    return @quick_array.find_index(pivot_value)
  end
end
