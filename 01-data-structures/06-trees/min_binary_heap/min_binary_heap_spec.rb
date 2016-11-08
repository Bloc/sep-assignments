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
    it "properly inserts a new node as a left child" do
      tree.insert(root, pacific_rim)
      expect(root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.insert(root, donnie)
      expect(root.left.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.insert(root, district)
      tree.insert(root, braveheart)
      expect(root.left.right.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, district)
      tree.insert(root, pacific_rim)
      expect(root.right.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      tree.insert(root, braveheart)
      tree.insert(root, inception)
      tree.insert(root, mad_max_2)
      expect(root.right.left.title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      tree.insert(root, braveheart)
      tree.insert(root, inception)
      tree.insert(root, mad_max_2)
      tree.insert(root, shawshank)
      expect(root.right.right.title).to eq "The Martian"
    end
  end

  # describe "#find(data)" do
  #   it "handles nil gracefully" do
  #     tree.insert(root, empire)
  #     tree.insert(root, mad_max_2)
  #     # expect(tree.find(root, nil)).to eq nil
  #   end
  #
  #   it "properly finds a left node" do
  #     tree.insert(root, pacific_rim)
  #     # expect(tree.find(root, pacific_rim.rating).rating).to eq 72
  #   end
  #
  #   it "properly finds a left-left node" do
  #     tree.insert(root, braveheart)
  #     tree.insert(root, pacific_rim)
  #     # expect(tree.find(root, pacific_rim.rating).rating).to eq 72
  #   end
  #
  #   it "properly finds a left-right node" do
  #     tree.insert(root, donnie)
  #     tree.insert(root, inception)
  #     # expect(tree.find(root, inception.rating).rating).to eq 86
  #   end
  #
  #   it "properly finds a right node" do
  #     tree.insert(root, district)
  #     # expect(tree.find(root, district.rating).rating).to eq 90
  #   end
  #
  #   it "properly finds a right-left node" do
  #     tree.insert(root, hope)
  #     tree.insert(root, martian)
  #     # expect(tree.find(root, martian.rating).rating).to eq 92
  #   end
  #
  #   it "properly finds a right-right node" do
  #     tree.insert(root, empire)
  #     tree.insert(root, mad_max_2)
  #     # expect(tree.find(root, mad_max_2.rating).rating).to eq 98
  #   end
  # end
  #
  # describe "#delete(data)" do
  #   it "handles nil gracefully" do
  #     # expect(tree.delete(root, nil)).to eq nil
  #   end
  #
  #   it "properly deletes a left node" do
  #     tree.insert(root, hope)
  #     tree.delete(root, hope.rating)
  #     # expect(tree.find(root, hope.rating)).to be_nil
  #   end
  #
  #   it "properly deletes a left-left node" do
  #     tree.insert(root, braveheart)
  #     tree.insert(root, pacific_rim)
  #     tree.delete(root, pacific_rim.rating)
  #     # expect(tree.find(root, pacific_rim.rating)).to be_nil
  #   end
  #
  #   it "properly deletes a left-right node" do
  #     tree.insert(root, donnie)
  #     tree.insert(root, inception)
  #     tree.delete(root, inception.rating)
  #     # expect(tree.find(root, inception.rating)).to be_nil
  #   end
  #
  #   it "properly deletes a right node" do
  #     tree.insert(root, district)
  #     tree.delete(root, district.rating)
  #     # expect(tree.find(root, district.rating)).to be_nil
  #   end
  #
  #   it "properly deletes a right-left node" do
  #     tree.insert(root, hope)
  #     tree.insert(root, martian)
  #     tree.delete(root, martian.rating)
  #     # expect(tree.find(root, martian.rating)).to be_nil
  #   end
  #
  #   it "properly deletes a right-right node" do
  #     tree.insert(root, empire)
  #     tree.insert(root, mad_max_2)
  #     tree.delete(root, mad_max_2.rating)
  #     # expect(tree.find(root, mad_max_2.rating)).to be_nil
  #   end
  # end
  #
  # describe "#printf" do
  #    specify {
  #      expected_output = "The Matrix: 87\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nPacific Rim: 72\nInception: 86\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nBraveheart: 78\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\nDistrict 9: 90\n"
  #      tree.insert(root, hope)
  #      tree.insert(root, empire)
  #      tree.insert(root, jedi)
  #      tree.insert(root, martian)
  #      tree.insert(root, pacific_rim)
  #      tree.insert(root, inception)
  #      tree.insert(root, braveheart)
  #      tree.insert(root, shawshank)
  #      tree.insert(root, district)
  #      tree.insert(root, mad_max_2)
  #     #  expect { tree.printf }.to output(expected_output).to_stdout
  #    }
  #
  #    specify {
  #      expected_output = "The Matrix: 87\nBraveheart: 78\nMad Max 2: The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
  #      tree.insert(root, mad_max_2)
  #      tree.insert(root, district)
  #      tree.insert(root, shawshank)
  #      tree.insert(root, braveheart)
  #      tree.insert(root, inception)
  #      tree.insert(root, pacific_rim)
  #      tree.insert(root, martian)
  #      tree.insert(root, jedi)
  #      tree.insert(root, empire)
  #      tree.insert(root, hope)
  #     #  expect { tree.printf }.to output(expected_output).to_stdout
  #    }
  # end
end
