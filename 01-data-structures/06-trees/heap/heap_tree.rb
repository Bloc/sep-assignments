require_relative 'node'

class HeapTree

  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  # insert new node at far left and swap up
	def insert(root, node)
		if node.nil?
			nil
		elsif root.nil? 
			self.root = node
		else
			go_to_bottom(nil,node)
			parent_compare(node, node.parent)
		end
	end

	# send added element to the bottom-left-most open slot
	def go_to_bottom(nodes=nil, target)
		next_row = []

		if nodes.nil?
			nodes = [self.root]
		end

		nodes.each do |node|
			if node.left == nil
				node.left = target
				node.left.parent = node
				return node
			elsif node.right == nil
				node.right = target
				node.right.parent = node
				return node
			else
				next_row << node.left
				next_row << node.right
			end
		end

		if next_row.count > 0 
			go_to_bottom(next_row, target)
		end
	end

	# compare parent and child, recursively checking up the tree until
	def parent_compare(child, parent)
		unless parent.nil?
			if child.rating < parent.rating
				swap(child, parent)
				parent_compare(child, child.parent)
			end 
		end
	end

	# swap a parent and child node
	def swap(child, parent)
		if child.rating < parent.rating

			temp_left = child.left
			temp_right = child.right

			child.parent = parent.parent
			parent.parent = child
			unless parent.left.nil?
				if parent.left == child
					child.left = parent
				else 
					child.left = parent.left
				end
			end

			unless parent.right.nil?
				if parent.right == child
					child.right = parent
				else
					child.right = parent.right
				end
			end

			parent.left = temp_left
			parent.right = temp_right

			if child.parent.nil?
				self.root = child
			end
		end
	end

	def delete(root,data)
	end

	def find(nodes, data)
    next_row = []

    if nodes.nil?
      nodes = [self.root]
    end

    if nodes == self.root
    	nodes = [self.root]
    end

    nodes.each do |node|
      if !node.nil?
        if node.title == data
          return node
        else
          next_row << node.left
          next_row << node.right
        end
      end
    end

    if next_row.count > 0
      find(next_row, data)
    end
	end

	def delete (root, data)
		# start at root
		# breadth search
		# - iterate over the array
		# - if not found repeat
		# - else 
		# -- refer to insert child/parent shenanigans
		# -- need preserve L->R order 
		# stop when both kids.nil?
	end

	def print(nodes=nil)
		next_row = []

    if nodes.nil?
      nodes = [self.root]
    end

    nodes.each do |node|
      if !node.nil?
        puts "#{node.title}: #{node.rating}"
        next_row << node.left
        next_row << node.right
      end
    end

    if next_row.count > 0
      print(next_row)
    end
	end

end