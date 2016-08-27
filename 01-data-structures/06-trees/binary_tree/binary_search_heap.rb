require_relative 'node'

class BinarySearchHeap

  # def initialize(root) #doesn't say use initialize but whatever
  #   @root = root
  # end

  def insert(root, node) #wondering about using data vs node says to use node...but can't figure out how to do it with just "data" I guess I'd need both the title and the rating in the data and then make the node...

    # If no root creating @root
    if root.nil? && @root.nil?
      @root = node
    elsif @root == root # If checking first (@root)
      #first case
      if node.rating > root.rating
        @root = node
        @root.left = root
        if root.right.nil? || root.left.rating > root.right.rating #compares orginal parent's children to insert into right (next-next largest)
          @root.right = root.left
        else
          @root.right = root.right
        end
      else
        if root.left.nil?
          root.left = node
        elsif root.right.nil?
          root.right = node
        else
          first_kids = []
          first_kids << root.left
          first_kids << root.right
          self.insert(first_kids, node)
        end
      end
    else #for all subsequent cases
      new_kids = [] #array to store children
      root.each do |child|
        if node.rating > child.rating # replacing the parent with new node if it is larger
          old_root = child # stores orginal parent value
          child = node # replaces parent with node
          child.left = old_root #sets new nodes left as orginal parent (next largest)
          if old_root.right.nil? || old_root.left.rating > old_root.right.rating  #compares orginal parent's children to insert into right (next-next largest)
            child.right = old_root.left
          else #do I need to check the left here for .nil?
            child.right = old_root.right
          end
          #check to make sure no empty values? maybe?
        else #checking for open children (spaces)
          if child.left.nil?
            child.left = node
          elsif child.right.nil?
            child.right = node
          else
            new_kids << child.left
            new_kids << child.right
          end
        end
      end
      self.insert(new_kids, node)
    end
  end


    #what if node.rating is larger than root?
    # if node.rating > root.rating
    #     #set new node to equal @root
    #     #sorting...
    #     #set root (old root) to @root.left and compare (old)root.left & (old)root.right insert larger one into @root.right
    #     #create something to check if every row until the last is fill (check the printf function - check the last part)
    # end


    #otherwise (possibly scratch the previous if)
      # starting with the @root check if it the node.rating is not larger than the parent

      # if it is,  we replace the parent with the new node, then assign the parent to the new node's.left (compare the parent's original .left and .right) and assign the larger into the new_node's.right  and make sure the new node is attached to the orignal parent's parent -- then we do some magic to make sure empty spaces are filled in.

      #otherwise we check the left and right for open spaces - if we find one we enter it

      # we are going to have to repeat(recurse?) this function to check "neighbooring" parents

      #if no luck we recurse - we end when .left && .right are nil - though I guess we don't need to do this because once we find a nil child we just empty it which is the same as hitting the end of the heap

  def delete(root, data)
  end

  def find(root, data)
  end

  def print(root)
  end
end
