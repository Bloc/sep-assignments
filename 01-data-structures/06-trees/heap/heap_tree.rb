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
			if node.left.nil?
				node.left = target
				node.left.parent = node
				return
			elsif node.right.nil?
				node.right = target
				node.right.parent = node
				return
			else
				next_row << node.left
				next_row << node.right
			end
		end

		if next_row.count > 0
			go_to_bottom(next_row, target)
		end
	end

	# compare parent and child, recursively checking up the tree
	def parent_compare(child, parent)
		unless parent.nil?
			if child.rating < parent.rating
				swap(child, parent)
				parent_compare(child, child.parent)
			end 
		end
	end

	# compare parent to both left, right kids, recursively checking down the tree
	def child_compare(parent)
		unless parent.nil?
			if parent.left.nil? && parent.right.nil?
				nil
			elsif parent.right.nil?
				if parent.rating > parent.left.rating
					swap(parent.left, parent)
				end
			else		
				if parent.rating > parent.left.rating || parent.rating > parent.right.rating
					if parent.left.rating < parent.right.rating
						swap(parent.left, parent)
						child_compare(parent.left)
					else
						swap(parent.right, parent)
						child_compare(parent.right)
					end
				end
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

	# locate the node, swap in bottom-right-most-node (brmn)
	def delete(root, data)
		target = find(root, data) unless data.nil?
		unless target.nil?
			brmn = find_bottom_right_most_node(root)

			if brmn != target
				target.title = brmn.title
				target.rating = brmn.rating
				
				# remove link to brmn from former parent
				unless brmn.parent.nil?
					if brmn.parent.right.title == brmn.title
						brmn.parent.right = nil
					else
						brmn.parent.left = nil
					end

					brmn.parent = nil
				end

				unless target.parent.nil?
					parent_compare(target, target.parent)
				end

				child_compare(target)
			else
				self.root = nil
			end
		end
	end

	def find_bottom_right_most_node(nodes)
		next_row = []

		if nodes.nil? || nodes == self.root
			nodes = [self.root]
		end

		nodes.each do |node|
			next_row << node.left unless node.left.nil?
			next_row << node.right unless node.right.nil?
		end

		if next_row.count > 0
			# on full row, look again recursively
			if next_row.count == 2 * nodes.count
				find_bottom_right_most_node(next_row)
			# otherwise compact the array and return the last element
			else
				return next_row.compact[next_row.compact.length - 1]
			end
		# or, just return the last item from the array of parent nodes
		else
			return nodes[nodes.count - 1]
		end
	end

	def find(nodes, data)
    next_row = []

    if nodes.nil? || nodes == self.root
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