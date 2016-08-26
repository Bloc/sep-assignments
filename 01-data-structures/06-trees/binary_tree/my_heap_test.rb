include RSpec

require_relative 'binary_search_heap'

RSpec.describe BinarySearchTree, type: Class do

  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { BinarySearchTree.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "insert data" do
    it "inserts a ton of stuff and some things are in the right place" do
      tree.insert(nil, root) #the matrix -- 87
      tree.insert(root, pacific_rim) #72
      expect(root.left).to eq pacific_rim

      tree.insert(root, braveheart) #78
      expect(root.right).to eq braveheart

      tree.insert(root, jedi) #80
      expect(root.left).to eq jedi

      tree.insert(root, donnie) #85
      tree.insert(root, inception) #86
      tree.insert(root, district) #90
      tree.insert(root, shawshank) #91
      tree.insert(root, martian) #92
      tree.insert(root, hope) #93
      tree.insert(root, empire) #94
      tree.insert(root, mad_max_2) #98
    end
  end

end
