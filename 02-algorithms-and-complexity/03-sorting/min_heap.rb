class MinHeap
  attr_accessor :elements

  def initialize(array)
    @elements = Array.new()
    array.each do |item|
      @elements << item
      bubble_up(@elements.size - 1)
    end
  end

  def bubble_up(index)
    parent_index = (index -1) / 2

    #return if we reach the root
    return if index <= 1

    #or if the parent is smaller than the child
    return if @elements[parent_index] <= @elements[index]

    #otherwise swap parent and child
    swap(index, parent_index)

    #and keep bubbling up
    bubble_up(parent_index)
  end

  def swap(source, target)
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end

  def delete_root
    #root is always at index = 0 in @elements array
    index = 0

    #swap root with last index in array
    swap(index, @elements.size - 1)

    #remove the last element in the list
    root = @elements.pop

    #make sure the tree is reordered
    bubble_down(index)

    #return the root
    root
  end

  def bubble_down(index)
    child_index = 2*index + 1

    #return if we reach the bottom of the tree
    return if child_index > @elements.size - 1

    #get smallest child
    not_last_element = child_index < @elements.size - 1
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]
    child_index += 1 if not_last_element && right_element < left_element

    #return if parent is smaller than child
    return if @elements[index] <= @elements[child_index]

    #else swap index with it's child
    swap(index, child_index)

    #repeat until parent is smaller than its children
    bubble_down(child_index)
  end
end
