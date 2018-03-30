include RSpec
require_relative 'min_heap'

RSpec.describe MinHeap, type: Class do
  let (:tree) { MinHeap.new([23,5,16,29,12,3,0]) }

  describe "#initialize" do
    it "initializes with an array of items" do
      expect(tree.elements.length).to eq 7
    end

    it "inserts elements in correct order" do
      expect(tree.elements).to eq [0, 5, 3, 29, 12, 23, 16]
    end
  end

  describe "#delete_root(data)" do
    it "properly deletes root and reorders accordingly" do
      tree.delete_root

      expect(tree.elements.size).to eq 6
      expect(tree.elements[1]).to eq 3
    end
  end
end
