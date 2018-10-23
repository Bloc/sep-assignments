require_relative 'node'

class MinHeap

attr_accessor :root, :heap

  def initialize(root)
    @root = root
    @heap = Array.new(1, @root)
  end

  def insert(data)
    @heap << data
    heap_up
  end

  def heap_up
    index = @heap.length - 1
    parent = ((index - 2.to_f) / 2).ceil
    while @heap[parent] && parent >= 0 && @heap[parent].rating > @heap[index].rating
      swap(parent, index)
      index = parent
      parent = ((index - 2.to_f) / 2).ceil
    end
  end

  def swap(index_one, index_two)
    temp = @heap[index_one]
    @heap[index_one] = @heap[index_two]
    @heap[index_two] = temp
  end

  def find(data)
    i = 0
    while i < @heap.length
      if(@heap[i].title == data)
        return @heap[i]
        i = @heap.length
      else
        i += 1
      end
    end
  end

  def delete(data)
    if(data == @heap.last.title)
      @heap.pop()
    else
      item_delete = find(data)
      @heap.delete(item_delete)
    end
  end

  def printf
    @heap.each do |item|
      puts "#{item.title}: #{item.rating}"
    end
  end

end
