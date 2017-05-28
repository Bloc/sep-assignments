include RSpec

require_relative 'heap'

RSpec.describe Heap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { Heap.new(root) }
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

  describe "#insert(root, data)" do
    it "properly inserts a new lower value node as left child" do
      tree.insert(root, district)
      expect(root.left.title).to eq "District 9"
    end

    it "properly inserts a new higher value node as right child" do
      tree.insert(root, shawshank)
      tree.insert(root, empire)
      expect(root.right.title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly inserts a new lower value node as root" do
      expected_output = "Pacific Rim: 72\nThe Matrix: 87\nStar Wars: Return of the Jedi: 80\n"
      tree.insert(root, jedi)
      tree.insert(jedi, pacific_rim)
      expect { tree.print }.to output(expected_output).to_stdout
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, hope)
      tree.delete(root, hope.title)
      expect(tree.find(root, hope.title)).to be_nil
    end

    it "properly deletes root node" do
      expected_output = "Braveheart: 78\nThe Matrix: 87\n"
      tree.insert(root, braveheart)
      tree.insert(braveheart, pacific_rim)
      tree.delete(pacific_rim, pacific_rim.title)
      expect { tree.print }.to output(expected_output).to_stdout
    end

    it "properly lowers a replacement node to correct location after deletion" do
      expected_output = "Braveheart: 78\nStar Wars: Return of the Jedi: 80\nDistrict 9: 90\nThe Matrix: 87\nDonnie Darko: 85\nStar Wars: The Empire Strikes Back: 94\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\nThe Shawshank Redemption: 91\nStar Wars: A New Hope: 93\nInception: 86\n"
      tree.insert(root, hope) #93
      tree.insert(root, empire) #94
      tree.insert(root, mad_max_2) #98
      tree.insert(root, shawshank) #91
      tree.insert(root, martian) #92
      tree.insert(root, district) #90
      tree.insert(root, jedi) #80
      tree.insert(jedi, donnie) #85
      tree.insert(jedi, inception) #86
      tree.insert(jedi, braveheart) #78
      tree.insert(braveheart, pacific_rim) #72
      tree.delete(pacific_rim, pacific_rim.title)
      expect(tree.find(braveheart, pacific_rim.title)).to be_nil
      expect { tree.print }.to output(expected_output).to_stdout
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, district)
      expect(tree.find(root, district.title).title).to eq "District 9"
    end

    it "properly finds a left-left node" do
      tree.insert(root, braveheart)
      tree.insert(braveheart, pacific_rim)
      tree.insert(pacific_rim, martian)
      expect(tree.find(pacific_rim, martian.title).title).to eq "The Martian"
    end
  end

  describe "#print" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(root, hope)
       tree.insert(root, empire)
       tree.insert(root, jedi)
       tree.insert(jedi, martian)
       tree.insert(jedi, pacific_rim)
       tree.insert(pacific_rim, inception)
       tree.insert(pacific_rim, braveheart)
       tree.insert(pacific_rim, shawshank)
       tree.insert(pacific_rim, district)
       tree.insert(pacific_rim, mad_max_2)
       expect { tree.print }.to output(expected_output).to_stdout
     }
     print()
  end

end
