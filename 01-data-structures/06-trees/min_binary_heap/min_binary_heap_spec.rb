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
    it "properly inserts a new node and swaps according to min_heap rules" do
      expected_output = "Pacific Rim: 72\nThe Matrix: 87\n"
      tree.insert(root, pacific_rim)
      expect { tree.printf }.to output(expected_output).to_stdout
    end


    it "properly inserts node and does a min heap sort" do
      expected_output = "Pacific Rim: 72\nBraveheart: 78\nDonnie Darko: 85\nThe Matrix: 87\nStar Wars: Return of the Jedi: 80\nMad Max 2: The Road Warrior: 98\nDistrict 9: 90\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nStar Wars: The Empire Strikes Back: 94\n"
      tree.insert(root, donnie)
      tree.insert(root, mad_max_2)
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, pacific_rim)
      tree.insert(root, district)
      tree.insert(root, jedi)
      tree.insert(root, shawshank)
      tree.insert(root, braveheart)
      expect { tree.printf }.to output(expected_output).to_stdout
    end

  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(nil)).to eq nil
    end

    it "properly finds the node position" do
      tree.insert(root, pacific_rim)
      expect(tree.find("Pacific Rim")).to eq 0
    end

    it "properly finds a node position" do
      tree.insert(root, donnie)
      tree.insert(root, mad_max_2)
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, pacific_rim)
      tree.insert(root, district)
      tree.insert(root, jedi)
      tree.insert(root, shawshank)
      tree.insert(root, braveheart)
      expect(tree.find("The Shawshank Redemption")).to eq 8
    end
  end


  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(nil)).to eq -1
    end

    it "properly deletes the last node" do
      tree.insert(root, hope)
      tree.delete("Star Wars: A New Hope")
      expect(tree.find("Star Wars: A New Hope")).to be_nil
    end
    #
    it "properly deletes a left-left node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.delete("Pacific Rim")
      expect(tree.find("Pacific Rim")).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.delete("Inception")
      expect(tree.find("Inception")).to be_nil
    end

   end

end
