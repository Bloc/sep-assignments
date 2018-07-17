include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeapTree, type: Class do
  let (:root) { Node.new("Pacific Rim", 72) }

  let (:tree) { MinBinaryHeapTree.new(root) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:matrix) { Node.new("The Matrix", 87) }
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
      tree.insert(root, matrix)
      expect(root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, matrix)
      tree.insert(root, district)
      expect(root.right.title).to eq "District 9"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      expect(root.left.left.title).to eq "Inception"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, hope)
      expect(root.right.right.title).to eq "Star Wars: A New Hope"
    end


    it "properly inserts and swaps new node as a left child" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, braveheart)
      expect(root.left.title).to eq "Braveheart"
    end

    it "properly inserts and swaps new node as a right child" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      tree.insert(root, shawshank)
      tree.insert(root, matrix)
      expect(root.right.title).to eq "The Matrix"
    end

  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, matrix)
      expect(tree.find(root, matrix.title).title).to eq "The Matrix"
    end

    it "properly finds a left-left node" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      expect(tree.find(root, inception.title).title).to eq "Inception"
    end

    it "properly finds a left-right node" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      tree.insert(root, shawshank)
      expect(tree.find(root, shawshank.title).title).to eq "The Shawshank Redemption"
    end

    it "properly finds a right node" do
      tree.insert(root, district)
      expect(tree.find(root, district.title).title).to eq "District 9"
    end

    it "properly finds a right-left node" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      expect(tree.find(root, martian.title).title).to eq "The Martian"
    end

    it "properly finds a right-right node" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, hope)
      expect(tree.find(root, hope.title).title).to eq "Star Wars: A New Hope"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, matrix)
      tree.delete(root, matrix.title)
      expect(tree.find(root, matrix.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      tree.delete(root, inception.title)
      expect(tree.find(root, inception.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      tree.insert(root, shawshank)
      tree.delete(root, shawshank.title)
      expect(tree.find(root, shawshank.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, matrix)
      tree.insert(root, district)
      tree.delete(root, district.title)
      expect(tree.find(root, district.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.delete(root, martian.title)
      expect(tree.find(root, martian.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(root, donnie)
      tree.insert(root, district)
      tree.insert(root, inception)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.delete(root, hope.title)
      expect(tree.find(root, hope.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(root, hope) #93
       tree.insert(root, empire) #94
       tree.insert(root, jedi) #80
       tree.insert(root, martian) #92
       tree.insert(root, braveheart) #78
       tree.insert(root, inception) #86
       tree.insert(root, matrix) #87
       tree.insert(root, shawshank) #91
       tree.insert(root, district) #90
       tree.insert(root, mad_max_2) #98
       expect { tree.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nThe Matrix: 87\nThe Shawshank Redemption: 91\nDistrict 9: 90\nInception: 86\nMad Max 2: The Road Warrior: 98\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
       tree.insert(root, mad_max_2) #98
       tree.insert(root, district) #90
       tree.insert(root, shawshank) #91
       tree.insert(root, matrix) #87
       tree.insert(root, inception) #86
       tree.insert(root, braveheart) #78
       tree.insert(root, martian) #92
       tree.insert(root, jedi) #80
       tree.insert(root, empire) #94
       tree.insert(root, hope) #93
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end