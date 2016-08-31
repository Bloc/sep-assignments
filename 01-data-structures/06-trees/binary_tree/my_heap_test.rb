include RSpec

require_relative 'binary_search_heap'

RSpec.describe BinarySearchHeap, type: Class do

  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { BinarySearchHeap.new() }
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

  describe "insert data" do
    it "inserts a ton of stuff and some things are in the right place" do
      tree.insert(nil, root) #the matrix -- 87
      tree.insert(root, district) #90
      tree.insert(root, martian) #92
      tree.insert(root, donnie) #85
      tree.insert(root, shawshank) #91
      tree.insert(root, pacific_rim) #72
      tree.insert(root, braveheart) #78
      tree.insert(root, jedi) #80
      tree.insert(root, inception) #86
      tree.insert(root, hope) #93
      tree.insert(root, empire) #94
      tree.insert(root, mad_max_2) #98


      expect(tree.root.rating).to eq 72
      expect(tree.root.left.rating).to eq 80
      expect(tree.root.right.rating).to eq 78
      expect(tree.root.left.left.rating).to eq 86
      expect(tree.root.left.right.rating).to eq 91
      expect(tree.root.right.left.rating).to eq 92
      expect(tree.root.right.right.rating).to eq 85
      expect(tree.root.left.left.left.rating).to eq 90
      expect(tree.root.left.left.right.rating).to eq 87
      expect(tree.root.left.right.left.rating).to eq 93
      expect(tree.root.left.right.right.rating).to eq 94
      expect(tree.root.right.left.left.rating).to eq 98
    end
  end

  describe "find tests" do
    it "finds what it's supposed to" do

      tree.insert(nil, root) #the matrix -- 87
      tree.insert(root, district) #90
      tree.insert(root, martian) #92
      tree.insert(root, donnie) #85
      tree.insert(root, shawshank) #91
      tree.insert(root, pacific_rim) #72
      tree.insert(root, braveheart) #78
      tree.insert(root, jedi) #80
      tree.insert(root, inception) #86
      tree.insert(root, hope) #93
      tree.insert(root, empire) #94
      tree.insert(root, mad_max_2) #98

      expect(tree.find(root, 98).rating).to eq 98
      expect(tree.find(root, 80).rating).to eq 80
      expect(tree.find(root, 72).rating).to eq 72
      expect(tree.find(root, 86).rating).to eq 86
      expect(tree.find(root, 78).rating).to eq 78
      expect(tree.find(root, 10)).to eq nil
    end
  end

  describe "delete" do
    it "deletes stuff I hope" do
      tree.insert(nil, root) #the matrix -- 87
      tree.insert(root, district) #90
      tree.insert(root, martian) #92
      tree.insert(root, donnie) #85
      tree.insert(root, shawshank) #91
      tree.insert(root, pacific_rim) #72
      tree.insert(root, braveheart) #78
      tree.insert(root, jedi) #80
      tree.insert(root, inception) #86
      tree.insert(root, hope) #93
      tree.insert(root, empire) #94
      tree.insert(root, mad_max_2) #98

      tree.delete(root, 92)
      expect(tree.find(root, 92)).to eq nil
    end

    it "maintains order" do
      tree.insert(nil, root) #the matrix -- 87
      tree.insert(root, district) #90
      tree.insert(root, martian) #92
      tree.insert(root, donnie) #85
      tree.insert(root, shawshank) #91
      tree.insert(root, pacific_rim) #72
      tree.insert(root, braveheart) #78
      tree.insert(root, jedi) #80
      tree.insert(root, inception) #86
      tree.insert(root, hope) #93
      tree.insert(root, empire) #94
      tree.insert(root, mad_max_2) #98

      tree.delete(root, 72)
      # tree.print()

      expect(tree.root.rating).to eq 78
      expect(tree.root.left.rating).to eq 86
      expect(tree.root.right.rating).to eq 80
      expect(tree.root.left.left.rating).to eq 87
      expect(tree.root.left.right.rating).to eq 91
      expect(tree.root.right.left.rating).to eq 92
      expect(tree.root.right.right.rating).to eq 85
      expect(tree.root.left.left.left.rating).to eq 98
      expect(tree.root.left.left.right.rating).to eq 90
      expect(tree.root.left.right.left.rating).to eq 93
      expect(tree.root.left.right.right.rating).to eq 94

      tree.delete(root, 86)
      # tree.print()

      expect(tree.root.rating).to eq 78
      expect(tree.root.left.rating).to eq 87
      expect(tree.root.right.rating).to eq 80
      expect(tree.root.left.left.rating).to eq 90
      expect(tree.root.left.right.rating).to eq 91
      expect(tree.root.right.left.rating).to eq 92
      expect(tree.root.right.right.rating).to eq 85
      expect(tree.root.left.left.left.rating).to eq 98
      expect(tree.root.left.left.right.rating).to eq 94
      expect(tree.root.left.right.left.rating).to eq 93


    end

    it "maintains order when stuff isn't removed" do
      tree.insert(nil, root) #the matrix -- 87
      tree.insert(root, district) #90
      tree.insert(root, martian) #92
      tree.insert(root, donnie) #85
      tree.insert(root, shawshank) #91
      tree.insert(root, pacific_rim) #72
      tree.insert(root, braveheart) #78
      tree.insert(root, jedi) #80
      tree.insert(root, inception) #86
      tree.insert(root, hope) #93
      tree.insert(root, empire) #94
      tree.insert(root, mad_max_2) #98

      tree.delete(root, 10)

      expect(tree.root.rating).to eq 72
      expect(tree.root.left.rating).to eq 80
      expect(tree.root.right.rating).to eq 78
      expect(tree.root.left.left.rating).to eq 86
      expect(tree.root.left.right.rating).to eq 91
      expect(tree.root.right.left.rating).to eq 92
      expect(tree.root.right.right.rating).to eq 85
      expect(tree.root.left.left.left.rating).to eq 90
      expect(tree.root.left.left.right.rating).to eq 87
      expect(tree.root.left.right.left.rating).to eq 93
      expect(tree.root.left.right.right.rating).to eq 94
      expect(tree.root.right.left.left.rating).to eq 98
    end

    it "deletes when bottom row is full" do
      tree.insert(nil, root) #the matrix -- 87
      tree.insert(root, district) #90
      tree.insert(root, martian) #92
      tree.insert(root, donnie) #85
      tree.insert(root, shawshank) #91
      tree.insert(root, pacific_rim) #72
      tree.insert(root, braveheart) #78
      tree.insert(root, jedi) #80
      tree.insert(root, inception) #86
      tree.insert(root, hope) #93
      tree.insert(root, empire) #94
      tree.insert(root, mad_max_2) #98

      tree.delete(root, 98)
      tree.delete(root, 94)
      tree.delete(root, 93)
      tree.delete(root, 90)
      tree.delete(root, 87)


      expect(tree.root.rating).to eq 72
      expect(tree.root.left.rating).to eq 80
      expect(tree.root.right.rating).to eq 78
      expect(tree.root.left.left.rating).to eq 86
      expect(tree.root.left.right.rating).to eq 91
      expect(tree.root.right.left.rating).to eq 92
      expect(tree.root.right.right.rating).to eq 85

      tree.print()

      tree.delete(root, 80)

      tree.print()

      expect(tree.root.rating).to eq 72
      expect(tree.root.left.rating).to eq 85
      expect(tree.root.right.rating).to eq 78
      expect(tree.root.left.left.rating).to eq 86
      expect(tree.root.left.right.rating).to eq 91
      expect(tree.root.right.left.rating).to eq 92


    end
  end


end
