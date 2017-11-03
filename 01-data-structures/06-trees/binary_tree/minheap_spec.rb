include RSpec

require_relative 'minheap'

RSpec.describe Minheap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { Minheap.new(root) }
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
      it "properly inserts a new node  with a lower rating as root" do
        heap.insert(root, pacific_rim)
        expect(root.title).to eq "The Matrix"
      end
    end

    describe "#find(data)" do
      it "handles nil gracefully" do
        heap.insert(root, empire)
        heap.insert(root, mad_max_2)
        expect(heap.find(root, nil)).to eq nil
      end
    end

    describe "#delete(data)" do
      it "handles nil gracefully" do
        expect(heap.delete(root, nil)).to eq nil
      end

      it "properly deletes a left node" do
        heap.insert(root, hope)
        heap.delete(root, hope.title)
        expect(heap.find(root, hope.title)).to be_nil
      end

      it "properly deletes a left-left node" do
        heap.insert(root, braveheart)
        heap.insert(root, pacific_rim)
        heap.delete(root, pacific_rim.title)
        expect(heap.find(root, pacific_rim.title)).to be_nil
      end

      it "properly deletes a left-right node" do
        heap.insert(root, donnie)
        heap.insert(root, inception)
        heap.delete(root, inception.title)
        expect(heap.find(root, inception.title)).to be_nil
      end

      it "properly deletes a right node" do
        heap.insert(root, district)
        heap.delete(root, district.title)
        expect(heap.find(root, district.title)).to be_nil
      end

      it "properly deletes a right-left node" do
        heap.insert(root, hope)
        heap.insert(root, martian)
        heap.delete(root, martian.title)
        expect(heap.find(root, martian.title)).to be_nil
      end

      it "properly deletes a right-right node" do
        heap.insert(root, empire)
        heap.insert(root, mad_max_2)
        heap.delete(root, mad_max_2.title)
        expect(heap.find(root, mad_max_2.title)).to be_nil
      end
    end


  end