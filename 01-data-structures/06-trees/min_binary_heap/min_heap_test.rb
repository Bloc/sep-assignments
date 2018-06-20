require_relative 'min_heap_tree'

root = Node.new("Pacific Rim", 72)

tree = MinHeapTree.new(root)
braveheart = Node.new("Braveheart", 78)
matrix = Node.new("The Matrix", 87)
jedi = Node.new("Star Wars: Return of the Jedi", 80)
donnie = Node.new("Donnie Darko", 85)
inception = Node.new("Inception", 86)
district = Node.new("District 9", 90)
shawshank = Node.new("The Shawshank Redemption", 91)
martian = Node.new("The Martian", 92)
hope = Node.new("Star Wars: A New Hope", 93)
empire = Node.new("Star Wars: The Empire Strikes Back", 94)
mad_max_2 = Node.new("Mad Max 2: The Road Warrior", 98)

#tree.insert(root, mad_max_2) #98 2

tree.insert(root, district) #90 1

tree.insert(root, shawshank) #91 1

tree.insert(root, matrix) #87 1

tree.insert(root, inception) #86 1

tree.insert(root, braveheart) #78 1

tree.insert(root, martian) #92 1

tree.insert(root, jedi) #80 1

tree.insert(root, empire) #94 1




tree.printf
