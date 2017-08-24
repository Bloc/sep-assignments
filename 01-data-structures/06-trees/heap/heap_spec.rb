include RSpec

require_relative 'heap'

RSpec.describe Heap, type: Class do
  let (:matrix) { Node.new("The Matrix", 87) }

  let (:tree) { Heap.new(matrix) }
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
    it "properly inserts a new node as a left child" do
      tree.insert(pacific_rim)
      expect(tree.root.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      expect(tree.root.right.title).to eq "Braveheart"
    end

    it "properly inserts a new node as a replacement for the left child" do
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(donnie)
      tree.insert(inception)
      expect(tree.root.left.title).to eq inception.title
      expect(tree.root.left.left.title).to eq pacific_rim.title
      expect(tree.root.left.right.title).to eq donnie.title
    end

    it "properly inserts a new node as a left-left child, which percolates up" do
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(district)
      expect(tree.root.title).to eq district.title
      expect(tree.root.left.title).to eq matrix.title
    end

  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect(tree.find(nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(pacific_rim)
      expect(tree.find("Pacific Rim").title).to eq pacific_rim.title
    end

    it "properly finds a right node" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      expect(tree.find("Pacific Rim").title).to eq pacific_rim.title
    end

    it "returns nil for bad data" do
      tree.insert(donnie)
      tree.insert(inception)
      expect(tree.find("Groundhog Day")).to be_nil
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(hope)
      tree.delete(hope.title)
      expect(tree.find(hope.title)).to be_nil
    end

  end

  describe "#printf" do
     specify {
       expected_output = 
        "Mad Max 2: The Road Warrior: 98\n" + 
        "Star Wars: The Empire Strikes Back: 94\n" +
        "Star Wars: A New Hope: 93\n" +
        "The Shawshank Redemption: 91\n" +
        "The Martian: 92\n" +
        "Pacific Rim: 72\n" + 
        "Inception: 86\n" +
        "Braveheart: 78\n" +
        "Star Wars: Return of the Jedi: 80\n" +
        "The Matrix: 87\n" + 
        "District 9: 90\n"
       tree.insert(hope)
       tree.insert(empire)
       tree.insert(jedi)
       tree.insert(martian)
       tree.insert(pacific_rim)
       tree.insert(inception)
       tree.insert(braveheart)
       tree.insert(shawshank)
       tree.insert(district)
       tree.insert(mad_max_2)
       puts("-----------------------------")
       tree.printf
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end
