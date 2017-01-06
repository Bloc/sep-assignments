class Movie
  include Comparable

  attr_reader :title
  attr_reader :rating

  def initialize(title, rating)
    @title = title
    @rating = rating
  end

  def <=> other
    self.rating <=> other.rating
  end

  def to_s
    "#@title: #@rating"
  end
end

class MinHeap
  def initialize
    @tree = []
  end

  def min
    @tree[0]
  end

  def insert data
    @tree.push(data)
    bubble_up(@tree.size - 1)
  end

  def find title
    if title != nil
      i = @tree.find_index { |item|
        item.title == title
      }
      @tree[i]
    end
  end

  def delete title
    if title != nil
      i = @tree.find_index { |item|
        item.title == title
      }
      loop {
        leftI = i * 2 + 1
        rightI = i * 2 + 2
        if leftI >= @tree.size
          break
        end
        leftItem = @tree[leftI]
        rightItem = @tree[rightI]
        if !rightItem || leftItem <= rightItem
          newI = leftI
          newItem = leftItem
        else
          newI = rightI
          newItem = rightItem
        end
        @tree[i] = newItem
        i = newI
      }
      lastItem = @tree.pop
      if i < @tree.size
        @tree[i] = lastItem
        bubble_up(i)
      end
    end
  end

  def print
    @tree.each { |item|
      puts(item)
    }
  end

  private

  def bubble_up i
    if i > 0
      parent = (i - 1) / 2
      if @tree[parent] > @tree[i]
        @tree[parent], @tree[i] = @tree[i], @tree[parent]
        bubble_up(parent)
      end
    end
  end

  def print_long
    @tree.each_index { |i|
      puts("#{i}: #{@tree[i]}")
    }
  end
end
