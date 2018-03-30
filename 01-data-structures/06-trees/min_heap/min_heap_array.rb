require_relative 'element'

class MinHeap
  attr_accessor :elements

  def initialize
    @elements = [nil]
  end

  def insert(element)
    @elements << element
    bubble_up(@elements.size - 1)
  end

  def bubble_up(index)
    parent_index = (index / 2)

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

  def find(data)
    #handle nil data search
    return nil if data.nil?

    @elements.detect do |element|
        element.title == data if element
    end
  end

  def delete(data)
    #handle nil data search
    return nil if data.nil?

    #find index of element to delete
    index = @elements.index do |element|
              element.title == data if element
            end

    unless index.nil?
      #swap the element with the last element in the list
      swap(index, @elements.size - 1)

      #remove the last element in the list
      @elements.pop

      #make sure the tree is reordered
      bubble_down(index)
    end
  end

  def bubble_down(index)
    child_index = index * 2

    #return if we reach the bottom of te tree
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

  def printf
    @elements.each do |element|
      puts "#{element.title}: #{element.rating}" if element
    end
  end

end
