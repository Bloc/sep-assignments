require_relative 'pixel'

RSpec.describe Pixel, type: Class do
  let(:std_pixel) { Pixel.new(255, 255, 255, 15, 15)}

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

    it "corrects invalid x and y" do
      pixel = Pixel.new(100, 100, 100, "asdf", "adsfkasjdl")
      expect(pixel.x).to eq 0
      expect(pixel.y).to eq 0
    end
  end

  describe "#update_color" do
    it "updates color" do
      expect(std_pixel.red).to eq 255
      expect(std_pixel.green).to eq 255
      expect(std_pixel.blue).to eq 255

      std_pixel.update_color(0, 0, 0)
      expect(std_pixel.red).to eq 0
      expect(std_pixel.green).to eq 0
      expect(std_pixel.blue).to eq 0
    end

    it "invalid input returns nil, does not change pixel colors" do
      expect(std_pixel.update_color("red", "green", "blue")).to be_nil
      expect(std_pixel.red).to eq 255
      expect(std_pixel.green).to eq 255
      expect(std_pixel.blue).to eq 255
    end
  end

  describe "#update_position" do
    it "updates position of the pixel" do
      expect(std_pixel.x).to eq 15
      expect(std_pixel.y).to eq 15

      std_pixel.update_position(0, 0)

      expect(std_pixel.x).to eq 0
      expect(std_pixel.y).to eq 0
    end
  end
end
