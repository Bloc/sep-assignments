require_relative 'pixel'

RSpec.describe Pixel, type: Class do
  describe "#initialize" do
    it "creates a pixel with the specified parameters" do
      pixel = Pixel.new(255, 200, 160, 5, 7)
       
      expect(pixel.red).to eq 255
      expect(pixel.green).to eq 200
      expect(pixel.blue).to eq 160
      expect(pixel.x).to eq 5
      expect(pixel.y).to eq 7
    end
    
    it "corrects a red value if it's less than 0" do
      pixel = Pixel.new(-7, 100, 100, 5, 5)
      expect(pixel.red).to eq 0
    end
    
    it "corrects a blue value if it's less than 0" do
      pixel = Pixel.new(100, -10, 100, 5, 5)
      expect(pixel.green).to eq 0
    end
    
    it "corrects a green value if it's less than 0" do
      pixel = Pixel.new(100, 100, -12, 5, 5)
      expect(pixel.blue).to eq 0
    end

    it "corrects a red value if it's greater than 255" do
      pixel = Pixel.new(256, 100, 100, 5, 5)
      expect(pixel.red).to eq 255
    end
    
    it "corrects a green value if it's greater than 255" do
      pixel = Pixel.new(100, 258, 100, 5, 5)
      expect(pixel.green).to eq 255
    end
    
    it "corrects a blue value if it's greater than 255" do
      pixel = Pixel.new(100, 100, 300, 5, 5)
      expect(pixel.blue).to eq 255
    end
  end
end
