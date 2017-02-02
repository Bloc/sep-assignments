include RSpec

require_relative 'node'
require_relative 'min_heap'

RSpec.describe MinHeapTree, type: Class do
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:tree) { MinHeapTree.new(matrix) }

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
    it "properly inserts a new node as a new root" do
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
      expect(tree.root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.right.title).to eq "Braveheart"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, district)
      expect(tree.root.left.left.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.root.right.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, hope)
      expect(tree.root.left.right.right.title).to eq "Star Wars: A New Hope"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      expect(tree.find(tree.root, nil)).to eq nil
    end

    it "properly finds a node 2 deep" do
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, district)
      expect(tree.find(tree.root, district.title).title).to eq "District 9"
    end

    it "properly finds a node 3 deep" do
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, pacific_rim)
      expect(tree.find(tree.root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a node" do
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, hope)
      expect(tree.find(tree.root, hope.title).title).to eq "Star Wars: A New Hope"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(tree.root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(tree.root, hope)
      tree.delete(tree.root, tree.root.left.title)
      expect(tree.find(tree.root, hope.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      tree.delete(tree.root, tree.root.right.title)
      expect(tree.find(tree.root, braveheart.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      tree.delete(tree.root, tree.root.left.left.title)
      expect(tree.find(tree.root, matrix.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.delete(tree.root, tree.root.right.right.title)
      expect(tree.find(tree.root, hope.title)).to be_nil
    end

    it "properly deletes a left-right-left node" do
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, district)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, jedi)
      tree.delete(tree.root, matrix.title)
      expect(tree.find(tree.root, matrix.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDonnie Darko: 85\nDistrict 9: 90\nThe Martian: 92\nThe Matrix: 87\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(tree.root, hope)
       tree.insert(tree.root, donnie)
       tree.insert(tree.root, empire)
       tree.insert(tree.root, jedi)
       tree.insert(tree.root, martian)
       tree.insert(tree.root, pacific_rim)
       tree.insert(tree.root, inception)
       tree.insert(tree.root, braveheart)
       tree.insert(tree.root, shawshank)
       tree.insert(tree.root, district)
       tree.insert(tree.root, mad_max_2)
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end
