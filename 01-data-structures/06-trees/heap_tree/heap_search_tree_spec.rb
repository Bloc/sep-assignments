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

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect(tree.find(tree.root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(pacific_rim)
      expect(tree.find(tree.root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a left-left node" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      expect(tree.find(tree.root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a left-right node" do
      tree.insert(donnie)
      tree.insert(inception)
      expect(tree.find(tree.root, inception.title).title).to eq "Inception"
    end

    it "properly finds a right node" do
      tree.insert(district)
      expect(tree.find(tree.root, district.title).title).to eq "District 9"
    end

    it "properly finds a right-left node" do
      tree.insert(hope)
      tree.insert(martian)
      expect(tree.find(tree.root, martian.title).title).to eq "The Martian"
    end

    it "properly finds a right-right node" do
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect(tree.find(tree.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#print" do
     specify {
       expected_output = "Star Wars: The Empire Strikes Back: 94\nThe Matrix: 87\nStar Wars: A New Hope: 93\nStar Wars: Return of the Jedi: 80\nPacific Rim: 72\nThe Martian: 92\nThe Shawshank Redemption: 91\nBraveheart: 78\nInception: 86\n"
       tree.insert(hope)
       tree.insert(empire)
       tree.insert(jedi)
       tree.insert(martian)
       tree.insert(pacific_rim)
       tree.insert(inception)
       tree.insert(braveheart)
       tree.insert(shawshank)
       expect { tree.print }.to output(expected_output).to_stdout
     }

  end
end
