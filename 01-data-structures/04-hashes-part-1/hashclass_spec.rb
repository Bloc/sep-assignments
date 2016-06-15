include RSpec

require_relative 'hash_item'
require_relative 'hashclass'

RSpec.describe HashClass, type: Class do
  let(:lotr_movies) { HashClass.new(6) }

  describe "#index" do
    it "creates a hash key based on the string value passed in" do
      i = lotr_movies.index("The Lord of the Rings: The Fellowship of the Ring", 6)
      expect(i).to eq 5
    end
  end

  describe "#key" do
    it "returns the sum of the ascii values of the string value" do
      key = "test"
      expect(lotr_movies.index(key, 6)).to eq 4
    end
  end

  describe "#resize" do
    it "doubles the size of the array when invoked" do
      expect(lotr_movies.size).to eq 6
      lotr_movies.resize
      expect(lotr_movies.size).to eq 12
    end

    it "copies existing values properly when the array is resized" do
      movies = HashClass.new(30)
      movies["A New Hope"] = "Average"
      movies["Empire Strikes Back"] = "Excellent"
      movies["Return of the Jedi"] = "The Best"
      movies.resize
      expect(movies.size).to eq 60
      expect(movies["A New Hope"]).to eq "Average"
      expect(movies["Empire Strikes Back"]).to eq "Excellent"
      expect(movies["Return of the Jedi"]).to eq "The Best"
    end
  end

  describe "hash[key] = value" do
    it "does not resize the array when a collision occurs and the values match" do
      hash = HashClass.new(1)
      hash["key"] = "value"
      expect(hash.size).to eq 1
      hash["key"] = "value"
      expect(hash.size).to eq 1
    end

    it "resizes the array when a collision occurs and the values do not match" do
      hash = HashClass.new(1)
      hash["key"] = "value"
      expect(hash.size).to eq 1
      hash["key"] = "different"
      expect(hash.size).to eq 2
    end

    it "sets the value of key to value" do
      lotr_movies["The Lord of the Rings: The Fellowship of the Ring"] = "3 hours, 48 minutes"
      lotr_movies["The Lord of the Rings: The Two Towers"] = "3 hours, 55 minutes"
      lotr_movies["The Lord of the Rings: The Return of the King"] = "3 hours, 21 minutes"
      lotr_movies["The Hobbit: An Unexpected Journey"] = "3 hours, 2 minutes"
      lotr_movies["The Hobbit: The Desolation of Smaug"] = "3 hours, 7 minutes"
      lotr_movies["The Hobbit: The Battle of Five Armies"] = "2 hours, 44 minutes"

      expect(lotr_movies["The Lord of the Rings: The Fellowship of the Ring"]).to eq "3 hours, 48 minutes"
      expect(lotr_movies["The Lord of the Rings: The Two Towers"]).to eq "3 hours, 55 minutes"
      expect(lotr_movies["The Lord of the Rings: The Return of the King"]).to eq "3 hours, 21 minutes"
      expect(lotr_movies["The Hobbit: An Unexpected Journey"]).to eq "3 hours, 2 minutes"
      expect(lotr_movies["The Hobbit: The Desolation of Smaug"]).to eq "3 hours, 7 minutes"
      expect(lotr_movies["The Hobbit: The Battle of Five Armies"]).to eq "2 hours, 44 minutes"
    end
  end
end