require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node < root
      if root.left
        insert(root.left, node)
      else
        root.left = node
      end
    else
      if root.right
        insert(root.right, node)
      else
        root.right = node
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root
      if root.title == data
        root
      else
        find(root.left, data) || find(root.right, data)
      end
    end
  end

  # Does not check to see if root is nil.
  def delete(root, data)
    if root == @root && root.title == data
      # Delete the root node.
      if !root.left
        @root = root.right
      else
        new_left, successor = delete_max(root.left)
        successor.left = new_left
        successor.right = root.right
        @root = successor
      end
    else
      [:left, :right].each { |branch|
        if root.send(branch)
          set_branch = branch.to_s + '='
          # See if root is the parent of the target node.
          if root.send(branch).title != data
            delete(root.send(branch), data)
            # Delete the child node.
          elsif !root.send(branch).left
            root.send(set_branch, root.send(branch).right)
          else
            deleted = root.send(branch)
            new_left, successor = delete_max(deleted.left)
            successor.left = new_left
            successor.right = deleted.right
            root.send(set_branch, successor)
          end
        end
      }
      nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=[@root])
    if !children.empty?
      node = children.delete_at(0)
      puts(node)
      if node.left
        children.push(node.left)
      end
      if node.right
        children.push(node.right)
      end
      printf(children)
    end
  end

  private

  # Deletes the max node from a subtree. Returns an array. [0] is the new head.
  # [1] is the deleted node.
  def delete_max head
    if !head.right
      [head.left, head]
    else
      current = head
      while current.right.right
        current = current.right
      end
      deleted = current.right
      current.right = deleted.left
      [head, deleted]
    end
  end
end
