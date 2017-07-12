include RSpec

require_relative 'line'

RSpec.describe Line, type: Class do
  let(:line) { Line.new }

  before do
    line.join("Hillary")
    line.join("Bernie")
    line.join("Donald")
    line.join("Ted")
    line.join("Jeb")
    line.join("Ben")
  end

  describe "#members" do
    it "cannot mutate members" do
      members = line.members
      members[0] = "john"
      expect(line.front).to eq "Hillary"
    end
  end

  describe "#front" do
    it "returns the first person in the line" do
      expect(line.front).to eq "Hillary"
    end

    it "cannot mutate front of the line" do
      front = line.front
      front = "john"
      expect(line.front).to eq "Hillary"
    end
  end

  describe "#initialize" do
    it "instantiates the members variable" do
      expect(line.members).to_not be_nil
    end
  end

  describe "#middle" do
    it "returns the person in the middle of the line" do
      expect(line.middle).to eq "Ted"
    end
  end

  describe "#back" do
    it "returns the person in the back of the line" do
      expect(line.back).to eq "Ben"
    end
  end

  describe "#search" do
    it "finds the person we're searching for" do
      person = line.search("Ted")
      expect(person).to eq "Ted"
    end
  end

  describe "#join" do
    it "adds a person to the back of the line" do
      line.join("Homer")
      expect(line.back).to eq "Homer"
    end
  end

  describe "#leave" do
    it "removes a person from the line" do
      line.leave("Donald")
      expect(line.search("Donald")).to be_nil
    end
  end

  describe "#place_in_line" do
    it "returns correct place in line" do
      expect(line.place_in_line("Donald")).to eq 3;
    end

    it "returns nil if no such person" do
      expect(line.place_in_line("Gary")).to be_nil
    end
  end

  describe "#next" do
    it "returns the next person and line and removes from the array of members" do
      expect(line.next).to eq "Hillary"
      expect(line.front).to eq "Bernie"
    end
  end
end
