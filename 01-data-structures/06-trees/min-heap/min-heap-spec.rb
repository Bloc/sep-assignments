include RSpec

require_relative 'min-heap'

RSpec.describe MinHeap, type: Class do
  let (:tree) { MinHeap.new }

  let (:matrix) { Movie.new("The Matrix", 87) }
  let (:pacific_rim) { Movie.new("Pacific Rim", 72) }
  let (:braveheart) { Movie.new("Braveheart", 78) }
  let (:jedi) { Movie.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Movie.new("Donnie Darko", 85) }
  let (:inception) { Movie.new("Inception", 86) }
  let (:district) { Movie.new("District 9", 90) }
  let (:shawshank) { Movie.new("The Shawshank Redemption", 91) }
  let (:martian) { Movie.new("The Martian", 92) }
  let (:hope) { Movie.new("Star Wars: A New Hope", 93) }
  let (:empire) { Movie.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Movie.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it('inserts a single record and shows it as the minimum') {
      tree.insert(matrix)
      expect(tree.min.title).to(eq('The Matrix'))
    }

    it('can insert many records and still show the correct minimum') {
      [matrix, pacific_rim, braveheart, jedi, donnie, inception, district,
       shawshank, martian, hope, empire, mad_max_2].each { |movie|
        tree.insert(movie)
      }
      expect(tree.min.title).to(eq('Pacific Rim'))
    }
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect(tree.find(nil)).to eq nil
    end

    it "properly finds a movie" do
      tree.insert(matrix)
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      expect(tree.find(pacific_rim.title).title).to eq "Pacific Rim"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(nil)).to eq nil
    end

    it('after deleting the min, leaves the next lowest as min') {
      [matrix, pacific_rim, braveheart, jedi, donnie, inception, district,
       shawshank, martian, hope, empire, mad_max_2].each { |movie|
        tree.insert(movie)
      }
      tree.delete('Pacific Rim')
      expect(tree.min.title).to(eq('Braveheart'))
    }
  end

  describe "#print" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
      tree.insert(matrix)
       tree.insert(hope)
       tree.insert(empire)
       tree.insert(jedi)
       tree.insert(martian)
       tree.insert(pacific_rim)
       tree.insert(inception)
       tree.insert(braveheart)
       tree.insert(shawshank)
       tree.insert(district)
       tree.insert(mad_max_2)
       expect { tree.print }.to output(expected_output).to_stdout
      tree.print
     }

     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nThe Matrix: 87\nThe Shawshank Redemption: 91\nDistrict 9: 90\nInception: 86\nMad Max 2: The Road Warrior: 98\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
      tree.insert(matrix)
       tree.insert(mad_max_2)
       tree.insert(district)
       tree.insert(shawshank)
       tree.insert(braveheart)
       tree.insert(inception)
       tree.insert(pacific_rim)
       tree.insert(martian)
       tree.insert(jedi)
       tree.insert(empire)
       tree.insert(hope)
       expect { tree.print }.to output(expected_output).to_stdout
     }
  end
end
