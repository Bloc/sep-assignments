include RSpec
require_relative 'min_heap_array'

RSpec.describe MinHeap, type: Class do
  let (:tree) { MinHeap.new }

  let (:pacific_rim) { Element.new("Pacific Rim", 72) }
  let (:matrix) { Element.new("The Matrix", 87) }
  let (:braveheart) { Element.new("Braveheart", 78) }
  let (:jedi) { Element.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Element.new("Donnie Darko", 85) }
  let (:inception) { Element.new("Inception", 86) }
  let (:district) { Element.new("District 9", 90) }
  let (:shawshank) { Element.new("The Shawshank Redemption", 91) }
  let (:martian) { Element.new("The Martian", 92) }
  let (:hope) { Element.new("Star Wars: A New Hope", 93) }
  let (:empire) { Element.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Element.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new element as a left child" do
      tree.insert(pacific_rim)
      tree.insert(matrix)

      expect(tree.elements[2].title).to eq "The Matrix"
    end

    it "properly inserts a new element as a right child" do
      tree.insert(pacific_rim)
      tree.insert(matrix)
      tree.insert(braveheart)

      expect(tree.elements[3].title).to eq "Braveheart"
    end

    it "inserts elements in correct order" do
      tree.insert(matrix)
      tree.insert(district)
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(inception)
      tree.insert(donnie)
      tree.insert(jedi)

      expect(tree.elements.size).to eq 8
      expect(tree.elements[1].title).to eq "Pacific Rim"
      expect(tree.elements[2].title).to eq "Braveheart"
      expect(tree.elements[3].title).to eq "Star Wars: Return of the Jedi"
      expect(tree.elements[4].title).to eq "District 9"
      expect(tree.elements[5].title).to eq "Inception"
      expect(tree.elements[6].title).to eq "The Matrix"
      expect(tree.elements[7].title).to eq "Donnie Darko"
    end
  end

  describe "#find(data)" do
    before do
      tree.insert(matrix)
      tree.insert(district)
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(inception)
      tree.insert(donnie)
      tree.insert(jedi)
    end

    it "handles nil gracefully" do
      expect(tree.find(nil)).to eq nil
    end

    it "handles a node not present" do
      expect(tree.find(martian)).to eq nil
    end

    it "properly finds an element" do
      expect(tree.find(braveheart.title).title).to eq "Braveheart"
      expect(tree.find(jedi.title).title).to eq "Star Wars: Return of the Jedi"
    end
  end

  describe "#delete(data)" do
    before do
      tree.insert(matrix)
      tree.insert(district)
      tree.insert(pacific_rim)
      tree.insert(braveheart)
      tree.insert(inception)
      tree.insert(donnie)
      tree.insert(jedi)
    end

    it "handles nil gracefully" do
      expect(tree.delete(nil)).to eq nil
    end

    it "properly deletes an element and reorders accordingly" do
      tree.delete(braveheart.title)

      expect(tree.find(braveheart.title)).to be_nil
      expect(tree.elements.size).to eq 7
      expect(tree.elements[2].title).to eq "Donnie Darko"
    end

    it "properly deletes root and reorders accordingly" do
      tree.delete(pacific_rim.title)

      expect(tree.find(pacific_rim.title)).to be_nil
      expect(tree.elements.size).to eq 7
      expect(tree.elements[1].title).to eq "Braveheart"
    end

  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDistrict 9: 90\nInception: 86\nThe Matrix: 87\nDonnie Darko: 85\n"

       tree.insert(matrix)
       tree.insert(district)
       tree.insert(pacific_rim)
       tree.insert(braveheart)
       tree.insert(inception)
       tree.insert(donnie)
       tree.insert(jedi)

       expect { tree.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output =  "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nThe Matrix: 87\nDonnie Darko: 85\nThe Shawshank Redemption: 91\nStar Wars: A New Hope: 93\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nThe Martian: 92\nInception: 86\nMad Max 2: The Road Warrior: 98\n"

       tree.insert(matrix)
       tree.insert(district)
       tree.insert(shawshank)
       tree.insert(pacific_rim)
       tree.insert(martian)
       tree.insert(braveheart)
       tree.insert(hope)
       tree.insert(inception)
       tree.insert(empire)
       tree.insert(donnie)
       tree.insert(jedi)
       tree.insert(mad_max_2)

       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end
