require_relative 'binary_search_tree'

root = Node.new("The Matrix", 87)
tree = BinarySearchTree.new(root)

empire = Node.new("Star Wars: The Empire Strikes Back", 94)
mad_max_2 = Node.new("Mad Max 2: The Road Warrior", 98) 

tree.insert(root, empire)
tree.insert(root, mad_max_2)
puts tree.find(root, mad_max_2.title).title
