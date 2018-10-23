include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinHeap, type: Class do
  let (:root_start) { Node.new("The Matrix", 87) }

  let (:heap) { MinHeap.new(root_start) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 96) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "swaps root if insert is smaller then root" do
      heap.insert(pacific_rim)
      expect(heap.heap[0].title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a left child" do
      heap.insert(district)
      expect(heap.heap[1].title).to eq "District 9"
    end

    it "properly inserts a new node as a left-left child" do
      heap.insert(pacific_rim)
      heap.insert(district)
      heap.insert(donnie)
      expect(heap.heap[3].title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-right child" do
      heap.insert(pacific_rim)
      heap.insert(district)
      heap.insert(donnie)
      heap.insert(empire)
      expect(heap.heap[4].title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly inserts a new node as a right child" do
      heap.insert(district)
      heap.insert(empire)
      expect(heap.heap[2].title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly inserts a new node as a right-left child" do
      heap.insert(district)
      heap.insert(empire)
      heap.insert(martian)
      heap.insert(hope)
      heap.insert(mad_max_2)
      expect(heap.heap[5].title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly inserts a new node as a right-right child" do
      heap.insert(district)
      heap.insert(empire)
      heap.insert(martian)
      heap.insert(hope)
      heap.insert(mad_max_2)
      heap.insert(inception)
      expect(heap.heap[6].title).to eq "Inception"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(empire)
      heap.insert(mad_max_2)
      expect(heap.find(nil)).to eq nil
    end

    it "properly finds a left node" do
      heap.insert(district)
      expect(heap.find(district.title).title).to eq "District 9"
    end

    it "properly finds a left-left node" do
      heap.insert(district)
      heap.insert(empire)
      heap.insert(martian)
      expect(heap.find(martian.title).title).to eq "The Martian"
    end

    it "properly finds a left-right node" do
      heap.insert(pacific_rim)
      heap.insert(district)
      heap.insert(donnie)
      heap.insert(empire)
      expect(heap.find(empire.title).title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly finds a right node" do
      heap.insert(district)
      heap.insert(empire)
      expect(heap.find(empire.title).title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly finds a right-left node" do
      heap.insert(district)
      heap.insert(empire)
      heap.insert(martian)
      heap.insert(hope)
      heap.insert(mad_max_2)
      expect(heap.find(mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly finds a right-right node" do
      heap.insert(district)
      heap.insert(empire)
      heap.insert(martian)
      heap.insert(hope)
      heap.insert(mad_max_2)
      heap.insert(inception)
      expect(heap.find(inception.title).title).to eq "Inception"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(district)
      heap.delete(district.title)
      expect(heap.find(district.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      heap.insert(district)
      heap.insert(empire)
      heap.insert(martian)
      heap.delete(martian.title)
      expect(heap.find(martian.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      heap.insert(pacific_rim)
      heap.insert(district)
      heap.insert(donnie)
      heap.insert(empire)
      heap.delete(empire.title)
      expect(heap.find(empire.title)).to be_nil
    end

    it "properly deletes a right node" do
      heap.insert(district)
      heap.insert(empire)
      heap.delete(empire.title)
      expect(heap.find(empire.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      heap.insert(district)
      heap.insert(empire)
      heap.insert(martian)
      heap.insert(hope)
      heap.insert(mad_max_2)
      heap.delete(mad_max_2.title)
      expect(heap.find(mad_max_2.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      heap.insert(district)
      heap.insert(empire)
      heap.insert(martian)
      heap.insert(hope)
      heap.insert(mad_max_2)
      heap.insert(inception)
      heap.delete(inception.title)
      expect(heap.find(inception.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 96\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(hope)
       heap.insert(empire)
       heap.insert(jedi)
       heap.insert(martian)
       heap.insert(pacific_rim)
       heap.insert(inception)
       heap.insert(braveheart)
       heap.insert(shawshank)
       heap.insert(district)
       heap.insert(mad_max_2)
       expect { heap.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nThe Matrix: 87\nThe Shawshank Redemption: 91\nInception: 96\nDistrict 9: 90\nMad Max 2: The Road Warrior: 98\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
       heap.insert(mad_max_2)
       heap.insert(district)
       heap.insert(shawshank)
       heap.insert(braveheart)
       heap.insert(inception)
       heap.insert(pacific_rim)
       heap.insert(martian)
       heap.insert(jedi)
       heap.insert(empire)
       heap.insert(hope)
       expect { heap.printf }.to output(expected_output).to_stdout
     }
  end
end
