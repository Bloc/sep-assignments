include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }
  let (:tree) { MinBinaryHeap.new(root) }
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
      expected_output = "Pacific Rim: 72\nThe Matrix: 87\n"
      tree.insert(root, pacific_rim)
      expect { tree.printf }.to output(expected_output).to_stdout
      expect(tree.root.left.title).to eq "The Matrix"
    end

    it "properly inserts new nodes as a left child and right child" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      expect(tree.root.right.title).to eq "Braveheart"
      expect(tree.root.left.title).to eq "The Matrix"
    end

    it "properly inserts 4 new nodes" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.insert(root, pacific_rim)
      tree.insert(root, jedi)
      expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nInception: 86\nThe Matrix: 87\nDonnie Darko: 85\n"
      expect(tree.root.left.right.title).to eq "Donnie Darko"
      expect{ tree.printf }.to output(expected_output).to_stdout
    end

    it "properly inserts 7 new nodes" do
      tree.insert(root, donnie)
      tree.insert(root, mad_max_2)
      tree.insert(root, empire)
      tree.insert(root, hope)
      tree.insert(root, inception)
      tree.insert(root, pacific_rim)
      tree.insert(root, jedi)
      expect(tree.root.title).to eq "Pacific Rim"
      expect(tree.root.left.title).to eq "Star Wars: Return of the Jedi"
      expect(tree.root.left.left.left.title).to eq "Star Wars: The Empire Strikes Back"
      expect(tree.root.right.right.title).to eq "Inception"

    end

    it "properly inserts a 2 nodes" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      expect(tree.root.title).to eq "The Matrix"
    end

    it "properly inserts 10 nodes" do
      tree.insert(root, mad_max_2)
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, braveheart)
      tree.insert(root, inception)
      tree.insert(root, pacific_rim)
      tree.insert(root, martian)
      tree.insert(root, jedi)
      tree.insert(root, empire)
      tree.insert(root, hope)
      expect(tree.root.right.right.title).to eq "Inception"
      expect(tree.root.left.right.right.title).to eq "Star Wars: A New Hope"
      expect(tree.root.left.left.left.title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(tree.root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, pacific_rim)
      expect(tree.find(tree.root, "Pacific Rim").title).to eq "Pacific Rim"
    end

    it "properly finds a node with 5 entries" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.insert(root, pacific_rim)
      tree.insert(root, jedi)
      expect(tree.find(tree.root, "Donnie Darko").title).to eq "Donnie Darko"
    end

    it "properly finds a node with 8 entries" do
      tree.insert(root, donnie)
      tree.insert(root, mad_max_2)
      tree.insert(root, empire)
      tree.insert(root, hope)
      tree.insert(root, inception)
      tree.insert(root, pacific_rim)
      tree.insert(root, jedi)
      expect(tree.find(tree.root, "Star Wars: The Empire Strikes Back").title).to eq "Star Wars: The Empire Strikes Back"
      expect(tree.find(tree.root, "Mad Max 2: The Road Warrior").title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly finds a right node" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      expect(tree.find(tree.root, "The Martian").title).to eq "The Martian"
    end

    it "properly finds a node with 11 entries" do
      tree.insert(root, mad_max_2)
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, braveheart)
      tree.insert(root, inception)
      tree.insert(root, pacific_rim)
      tree.insert(root, martian)
      tree.insert(root, jedi)
      tree.insert(root, empire)
      tree.insert(root, hope)
      expect(tree.find(tree.root, "Star Wars: The Empire Strikes Back").title).to eq "Star Wars: The Empire Strikes Back"
      expect(tree.find(tree.root, "Mad Max 2: The Road Warrior").title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(tree.root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, hope)
      tree.delete(root, hope.title)
      expect(tree.find(tree.root, hope.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.delete(root, "Pacific Rim")
      expect(tree.find(tree.root, "Pacific Rim")).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.delete(root, "Inception")
      expect(tree.find(tree.root, "Inception")).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, district)
      tree.delete(root, "District 9")
      expect(tree.find(tree.root, "District 9")).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      tree.delete(root, "The Martian")
      expect(tree.find(tree.root, "The Martian")).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      tree.delete(root, mad_max_2.title)
      expect(tree.find(tree.root, mad_max_2.title)).to be_nil
    end

    it "properly deletes a root node" do
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, jedi)
      tree.insert(root, martian)
      tree.insert(root, pacific_rim)
      tree.insert(root, inception)
      tree.insert(root, braveheart)
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.insert(root, mad_max_2)
      tree.delete(root, root.title)
      expect(tree.find(tree.root, "Pacific Rim")).to be_nil
    end

    it "properly deletes a node with children" do
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, jedi)
      tree.insert(root, martian)
      tree.insert(root, pacific_rim)
      tree.insert(root, inception)
      tree.insert(root, braveheart)
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.insert(root, mad_max_2)
      tree.delete(tree.root, "District 9")
      expect(tree.find(tree.root, "District 9")).to be_nil
    end

    it "properly deletes a node with left children" do
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, jedi)
      tree.insert(root, martian)
      tree.insert(root, pacific_rim)
      tree.insert(root, inception)
      tree.insert(root, braveheart)
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.delete(tree.root, "District 9")
      expect(tree.find(tree.root, "District 9")).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(root, hope)
       tree.insert(root, empire)
       tree.insert(root, jedi)
       tree.insert(root, martian)
       tree.insert(root, pacific_rim)
       tree.insert(root, inception)
       tree.insert(root, braveheart)
       tree.insert(root, shawshank)
       tree.insert(root, district)
       tree.insert(root, mad_max_2)
       expect { tree.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nThe Matrix: 87\nThe Shawshank Redemption: 91\nDistrict 9: 90\nInception: 86\nMad Max 2: The Road Warrior: 98\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
       tree.insert(root, mad_max_2)
       tree.insert(root, district)
       tree.insert(root, shawshank)
       tree.insert(root, braveheart)
       tree.insert(root, inception)
       tree.insert(root, pacific_rim)
       tree.insert(root, martian)
       tree.insert(root, jedi)
       tree.insert(root, empire)
       tree.insert(root, hope)
       tree.printf
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end
