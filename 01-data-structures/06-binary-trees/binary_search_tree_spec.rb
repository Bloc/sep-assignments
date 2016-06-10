include RSpec

RSpec.describe BinarySearchTree, type: Class do
  let (:tree) { BinarySearchTree.new() }
  let (:root) { Node.new("Donnie Darko", 85) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:the_martian) { Node.new("The Martian", 92) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:inception) { Node.new("Inception", 86) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:district) { Node.new("District 9", 90) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "inserts a new root if it is null" do
      tree.insert(nil, root)
      expect(tree.find(nil, "Donnie Darko")).to_not be_nil
    end

    it "inserts a new node as a left child" do
      tree.insert(root, jedi)
      expect(root.left.title).to eq "Star Wars: Return of the Jedi"
    end

    it "inserts a new node as a left-left child" do
      tree.insert(root, jedi)
      tree.insert(root, pacific_rim)
      expect(root.left.left.title).to eq "Pacific Rim"
    end

    it "inserts a new node as a right child" do
      tree.insert(root, empire)
      expect(root.right.title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "inserts a new node as a right-right child" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(root.right.right.title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#find(data)" do
    it "finds a node by it's title" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end

    it "hanldes nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, nil)).to eq nil
    end
  end

  describe "#delete(data)" do

  end

  describe "#printf" do
    expected_output = "Donnie Darko: 85\nStar Wars: Return of the Jedi: 80\nInception: 86\nBraveheart: 78\nThe Matrix: 87\nPacific Rim: 72\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
     specify {
       tree.insert(nil, root)
       tree.insert(root, hope)
       tree.insert(root, empire)
       tree.insert(root, jedi)
       tree.insert(root, the_martian)
       tree.insert(root, pacific_rim)
       tree.insert(root, inception)
       tree.insert(root, braveheart)
       tree.insert(root, shawshank)
       tree.insert(root, matrix)
       tree.insert(root, district)
       tree.insert(root, mad_max_2)

       expect { tree.printf }.to output(expected_output).to_stdout
     }

     specify {
       tree.insert(nil, root)
       tree.insert(root, mad_max_2)
       tree.insert(root, district)
       tree.insert(root, matrix)
       tree.insert(root, shawshank)
       tree.insert(root, braveheart)
       tree.insert(root, inception)
       tree.insert(root, pacific_rim)
       tree.insert(root, the_martian)
       tree.insert(root, jedi)
       tree.insert(root, empire)
       tree.insert(root, hope)

       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end
