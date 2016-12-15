include RSpec

require_relative 'pixel'

RSpec.describe Pixel, type: Class do
  let(:pixel) { Pixel.new(255, 255, 255, 0, 0) }

  describe "#initialize" do
    it "creates a pixel with the specified parameters" do
      expect(pixel.red).to eq 255
      expect(pixel.green).to eq 255
      expect(pixel.blue).to eq 255
      expect(pixel.x).to eq 0
      expect(pixel.y).to eq 0
    end

    it "corrects a pixel color value if it's less than 0" do
      p = Pixel.new(-1, 0, 0, 0, 0)
      expect(p.red).to eq 0
    end

    it "corrects a pixel color value if it's greater than 255" do
      p = Pixel.new(256, 0, 0, 0, 0)
      expect(p.red).to eq 255
    end
  end
end