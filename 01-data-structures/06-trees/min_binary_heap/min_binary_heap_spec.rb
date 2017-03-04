include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { MinBinaryHeap.new(root) }
  let (:node1) { Node.new("Pacific Rim", 72) }
  let (:node2) { Node.new("Braveheart", 78) }
  let (:node3) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:node4) { Node.new("Donnie Darko", 85) }
  let (:node5) { Node.new("Inception", 86) }
  let (:node6) { Node.new("District 9", 90) }
  let (:node7) { Node.new("The Shawshank Redemption", 91) }
  let (:node8) { Node.new("The Martian", 92) }
  let (:node9) { Node.new("Star Wars: A New Hope", 93) }
  let (:node10) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:node11) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left-right child" do
      tree.insert(root, node4) #85
      tree.insert(root, node5) #86
      tree.insert(root, node6) #90
      tree.insert(root, node2) #78
      expect(root.rating).to eq 78
      expect(root.left.rating).to eq 85
      expect(root.right.rating).to eq 86
      expect(root.left.left.rating).to eq 90
      expect(root.left.right.rating).to eq 87
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, node9) #93
      tree.insert(root, node8) #92
      tree.insert(root, node2) #78
      tree.insert(root, node5) #86
      tree.insert(root, node11) #98
      expect(root.rating).to eq 78
      expect(root.left.rating).to eq 86
      expect(root.right.rating).to eq 92
      expect(root.left.left.rating).to eq 93
      expect(root.left.right.rating).to eq 87
      expect(root.right.left.rating).to eq 98
    end
  end

  describe "#find(data)" do
    it "properly finds a left-right node" do
      tree.insert(root, node2) #78
      tree.insert(root, node4) #85
      tree.insert(root, node5) #86
      tree.insert(root, node6) #90
      expect(tree.find(root, node6.rating).rating).to eq 90
    end

    it "properly finds a right-left node" do
      tree.insert(root, node2) #78
      tree.insert(root, node5) #86
      tree.insert(root, node11) #98
      tree.insert(root, node9) #93
      tree.insert(root, node8) #92
      expect(tree.find(root, node8.rating).rating).to eq 92
    end
  end

  describe "#delete(data)" do
    it "properly deletes a left-right node" do
      tree.insert(root, node6) #90
      tree.insert(root, node2) #78
      tree.insert(root, node4) #85
      tree.insert(root, node5) #86
      tree.delete(root, node5.rating)
      expect(tree.find(root, node5.rating).rating).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(root, node9) #93
      tree.insert(root, node8) #92
      tree.insert(root, node2) #78
      tree.insert(root, node5) #86
      tree.insert(root, node11) #98
      tree.delete(root, node11.rating)
      expect(tree.find(root, node11.rating).rating).to be_nil
    end
  end

  describe "#printf" do
    specify {
      expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
      tree.insert(root, node9) #93
      tree.insert(root, node10) #94
      tree.insert(root, node3) #80
      tree.insert(root, node8) #92
      tree.insert(root, node1) #72
      tree.insert(root, node5) #86
      tree.insert(root, node2) #78
      tree.insert(root, node7) #91
      tree.insert(root, node6) #90
      tree.insert(root, node11) #98
      expect { tree.printf }.to output(expected_output).to_stdout
    }
  end
end