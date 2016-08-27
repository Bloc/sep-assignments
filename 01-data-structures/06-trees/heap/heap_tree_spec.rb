include RSpec

require_relative 'heap_tree'

RSpec.describe HeapTree, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { HeapTree.new(root) }
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
    it "properly inserts a higher value below root for min-heap" do
      tree.insert(tree.root, district)
      expect(tree.root.title).to eq "The Matrix"
    end

    it "properly inserts a higher value to root.right for min-heap" do
    	tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      expect(tree.root.right.title).to eq "The Shawshank Redemption"
    end

    it "properly inserts a lower value as root for min-heap" do
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node, coughs up correct left-left child" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.root.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, martian)
      expect(tree.root.left.left.title).to eq "The Martian"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      expect(tree.root.right.right.title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#find(nodes=nil, data)" do
    it "handles nil gracefully" do
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, nil)).to eq nil
    end

    it "properly finds a min node at root" do
      tree.insert(tree.root, pacific_rim)
      expect(tree.find(tree.root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a new left node" do
      tree.insert(tree.root, inception)
      expect(tree.find(tree.root, inception.title).title).to eq "Inception"
    end

    it "properly finds a new right node" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.find(tree.root, inception.title).title).to eq "Inception"
    end

    it "properly finds a new 3rd tier left leaf node" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.find(tree.root, district.title).title).to eq "District 9"
    end

    it "properly finds a new 3rd tier right leaf node" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, empire)
      expect(tree.find(tree.root, empire.title).title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly finds a new 3rd tier right-side leaf" do
      tree.insert(tree.root, empire)
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(tree.root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(tree.root, hope)
      tree.delete(tree.root, hope.title)
      expect(tree.find(tree.root, hope.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.delete(tree.root, martian.title)
      expect(tree.find(tree.root, martian.title)).to be_nil
    end

    it "properly deletes a root node" do
    	tree.delete(tree.root, root.title)
      expect(tree.find(tree.root, root.title)).to be_nil
    end

    it "properly deletes a root node plus bottom-right-most-swap" do
    	tree.insert(tree.root, pacific_rim)
    	tree.insert(tree.root, braveheart)
    	tree.delete(tree.root, pacific_rim.title)
    	expect(tree.find(tree.root, "Pacific Rim")).to be_nil
    end

    it "properly deletes a left-left node of 3 row heap" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.delete(tree.root, martian.title)
      expect(tree.find(tree.root, 'The Martian')).to be_nil
    end

    it "properly deletes a right-right node of a 3 row heap" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      tree.delete(tree.root, mad_max_2.title)
      expect(tree.find(tree.root, "Mad Max 2: The Road Warrior")).to be_nil
    end

    it "properly deletes a left node of a 3 row heap" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      tree.delete(tree.root, district.title)
      expect(tree.find(tree.root, "District 9")).to be_nil
    end

    it "properly deletes a right node of a 3 row heap" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      tree.delete(tree.root, shawshank.title)
      expect(tree.find(tree.root, "The Shawshank Redemption")).to be_nil
    end
  end

  describe "#print function ought to work" do
  	
    specify {
      expected_output = "Pacific Rim: 72\nThe Matrix: 87\nInception: 86\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
	      tree.insert(tree.root, pacific_rim)
	      tree.insert(tree.root, inception)
	      tree.insert(tree.root, district)
	      tree.insert(tree.root, shawshank)
			  tree.insert(tree.root, martian)
	      tree.insert(tree.root, hope)
	      tree.insert(tree.root, empire)
	      tree.insert(tree.root, mad_max_2)
      expect { tree.print }.to output(expected_output).to_stdout
    }
 
  end

end