#!/usr/bin/env ruby

require('benchmark')

require_relative('min-heap/min-heap')

class Node
  include Comparable

  attr_reader :data
  attr_reader :branches

  def initialize(data)
    @data = data
    @branches = [nil, nil]
  end

  def <=> other
    self.data <=> other.data
  end

  def to_s
    "#@data"
  end
end

class BinarySearchTree
  def insert(data, root=@root)
    if !@root
      @root = Node.new(data)
    else
      i = if data < root.data
            0
          else
            1
          end
      if root.branches[i]
        insert(data, root.branches[i])
      else
        root.branches[i] = Node.new(data)
      end
    end
  end

  # Recursive Depth First Search
  def find(data, root=@root)
    if root
      if root.data == data
        data
      else
        find(data, root.branches[0]) || find(data, root.branches[1])
      end
    end
  end

  def delete(data, root=0)
    if root.equal?(0)
      root = @root
    end
    if root
      if root.equal?(@root) && root.data == data
        # Delete the root node.
        if !root.branches[0]
          @root = root.branches[1]
          # Go left and find the right-most node from there.
        elsif !root.branches[0].branches[1]
          root.branches[0].branches[1] = root.branches[1]
          @root = root.branches[0]
        else
          leaf_parent = root.branches[0]
          while leaf_parent.branches[1].branches[1]
            leaf_parent = leaf_parent.branches[1]
          end
          leaf = leaf_parent.branches[1]
          leaf_parent.branches[1] = leaf.branches[0]
          leaf.branches[0] = root.branches[0]
          leaf.branches[1] = root.branches[1]
          @root = leaf
        end
      else
        (0...2).each { |i|
          if root.branches[i]
            # See if root is the parent of the target node.
            if root.branches[i].data != data
              delete(data, root.branches[i])
              # Delete root.branches[i].
            elsif !root.branches[i].branches[0]
              root.branches[i] = root.branches[i].branches[1]
              break
              # Go left and find the right-most node from there.
            elsif !root.branches[i].branches[0].branches[1]
              root.branches[i].branches[0].branches[1] =
                root.branches[i].branches[1]
              root.branches[i] = root.branches[i].branches[0]
              break
            else
              leaf_parent = root.branches[i].branches[0]
              while leaf_parent.branches[1].branches[1]
                leaf_parent = leaf_parent.branches[1]
              end
              leaf = leaf_parent.branches[1]
              leaf_parent.branches[1] = leaf.branches[0]
              leaf.branches[0] = root.branches[i].branches[0]
              leaf.branches[1] = root.branches[i].branches[1]
              root.branches[i] = leaf
              break
            end
          end
        }
      end
    end
  end

  # Recursive Breadth First Search
  def print(children=[@root])
    if !children.empty?
      node = children.delete_at(0)
      puts(node)
      node.branches.each { |branch|
        if branch
          children.push(branch)
        end
      }
      print(children)
    end
  end
end

# Monkey patch
class MinHeap
  def find title
    if title != nil
      i = @tree.find_index { |item|
        item == title
      }
      if i
        @tree[i]
      end
    end
  end

  def delete title
    if title != nil
      i = @tree.find_index { |item|
        item == title
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
end

Benchmark.bmbm { |x|
  binary = BinarySearchTree.new
  heap = MinHeap.new

  rng = Random.new(1)
  inputs = (1..100_000).to_a.shuffle(random: rng)

  x.report('BinarySearchTree#insert') {
    inputs.each { |n|
      binary.insert(n)
    }
  }
  x.report('MinHeap#insert') {
    inputs.each { |n|
      heap.insert(n)
    }
  }

  x.report('BinarySearchTree#find') {
    binary.find(50000)
  }
  x.report('MinHeap#find') {
    heap.find(50000)
  }

  inputs.shuffle!(random: rng)

  x.report('BinarySearchTree#delete') {
    inputs.each { |n|
      binary.delete(n)
    }
  }
  x.report('MinHeap#delete') {
    inputs.each { |n|
      heap.delete(n)
    }
  }
}
