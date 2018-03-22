require_relative 'screen'

RSpec.describe Screen, type: Class do
  let(:screen) { Screen.new(10, 10) }

  describe "#insert" do
    it "inserts a pixel at the proper x, y coordinates" do
      pixel = Pixel.new(255, 200, 175, 1, 1)
      screen.insert(pixel, 1, 1)

      expect(screen.at(1, 1)).to eq pixel
    end

    it "retains color information upon insertion" do
      pixel = Pixel.new(255, 200, 175, 1, 1)
      screen.insert(pixel, 1, 1)

      p1 = screen.at(1, 1)
      expect(p1.red).to eq pixel.red
      expect(p1.green).to eq pixel.green
      expect(p1.blue).to eq pixel.blue
    end
  end

  describe "#at" do
    it "returns the pixel at a specific location" do
      pixel = Pixel.new(255, 200, 175, 1, 1)
      screen.insert(pixel, 1, 2)

      p1 = screen.at(1, 2)
      expect(p1).to eq pixel
    end

    it "handles invalid x, y values gracefully" do
      pixel = screen.at(-1, -1)

      expect(pixel).to eq nil
    end
  end

  describe "#search" do
    it "returns an array of matching pixel coordinates" do
      pixel_1 = Pixel.new(255, 200, 175, 1, 1)
      pixel_2 = Pixel.new(255, 200, 175, 2, 2)
      pixel_3 = Pixel.new(255, 200, 175, 3, 3)
      different_color_pixel = Pixel.new(111,222,111, 4, 4)

      screen.insert(pixel_1, 1, 1)
      screen.insert(pixel_2, 2, 2)
      screen.insert(pixel_3, 3, 3)
      screen.insert(different_color_pixel, 4, 4)

      search_results = screen.search(pixel_1)

      expect(search_results).to eq [[1,1],[2,2],[3,3]]
    end
  end

end
