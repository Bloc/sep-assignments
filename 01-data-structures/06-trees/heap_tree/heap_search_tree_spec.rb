include RSpec

require_relative 'heap_search_tree'

RSpec.describe HeapSearchTree, type: Class do
  let (:matrix) { Node.new("The Matrix", 87) }

  let (:tree) { HeapSearchTree.new(matrix) }
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

  describe "#insert(data)" do
    it "properly insures nil is passed" do
      expect(tree.insert(nil)).to eq nil
    end

    it "properly inserts and changes root node when high left node is inserted" do
      tree.insert(district)
      expect(tree.root.title).to eq "District 9"
    end

    it "properly inserts and changes root when root.left is NOT nil and inserted node on right is higher" do
      tree.insert(district)
      tree.insert(martian)
      expect(tree.root.right.title).to eq "District 9"
      expect(tree.root.title).to eq "The Martian"
    end

    it "properly inserts a new node as a left child" do
      tree.insert(pacific_rim)
      expect(tree.root.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      expect(tree.root.right.title).to eq "Braveheart"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(jedi)
      expect(tree.root.left.left.title).to eq "Pacific Rim"
    end

  end
end
