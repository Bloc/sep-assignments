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

  describe "#initialize" do
    it "instantiates the members variable" do
      expect(line.members).to_not be_nil
    end
  end

  describe "#front" do
    it "returns the first person in the line" do
      expect(line.front).to eq "Hillary"
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

end