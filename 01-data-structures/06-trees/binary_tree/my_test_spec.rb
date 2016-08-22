include RSpec

require_relative 'binary_search_tree'

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

  describe "test the insert method" do
    it "properly inserts a right child correctly" do
      tree.insert(root, district)
      expect(root.right).to eq district
    end
    it "properly insert a left child correctly" do
      tree.insert(root, braveheart)
      expect(root.left).to eq braveheart
    end
    it "properly inserts a right grandchild" do
      tree.insert(root, district)
      tree.insert(root, martian)
      expect(root.right.right).to eq martian
    end
    it "properly insert a left left grandchild" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      expect(root.left.left).to eq pacific_rim
    end
  end

  describe "testing dat find method" do
    it "returns some correct nodes" do
      tree.insert(root, district)
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, martian)
      expect(tree.find(root, braveheart.rating)).to eq braveheart
      expect(tree.find(root, district.rating)).to eq district
      expect(tree.find(root, pacific_rim.rating)).to eq pacific_rim
      expect(tree.find(root, martian.rating)).to eq martian
    end
  end
end
