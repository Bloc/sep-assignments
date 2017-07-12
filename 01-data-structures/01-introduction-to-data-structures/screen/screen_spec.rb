require_relative 'screen'

RSpec.describe Screen, type: Class do
  let(:screen) { Screen.new(10, 10) }

  describe "#insert" do
    it "inserts a pixel at the proper x, y coordinates" do
      pixel = Pixel.new(255, 200, 175, 1, 1)
      screen.insert(pixel)

      expect(screen.at(1, 1)).to eq pixel
    end

    it "retains color information upon insertion" do
      pixel = Pixel.new(255, 200, 175, 1, 1)
      screen.insert(pixel)

      p1 = screen.at(1, 1)
      expect(p1.red).to eq pixel.red
      expect(p1.green).to eq pixel.green
      expect(p1.blue).to eq pixel.blue
    end
  end

  describe "#at" do
    it "returns the pixel at a specific location" do
      pixel = Pixel.new(255, 200, 175, 1, 1)
      screen.insert(pixel)

      p1 = screen.at(1, 1)
      expect(p1).to eq pixel
    end

    it "handles invalid x, y values gracefully" do
      pixel = screen.at(-1, -1)

      expect(pixel).to eq nil
    end
  end

  describe "#matrix" do
    it "returns the matrix" do
      matrix = screen.matrix
      expect(matrix.length).to eq 10
      expect(matrix[0].length).to eq 10
    end
  end

  describe "#show_matrix" do
    it "displays the matrix" do
      screen = Screen.new(2, 2)
      screen.insert(Pixel.new(0, 0, 0, 0, 0))
      screen.insert(Pixel.new(0, 0, 0, 0, 1))
      screen.insert(Pixel.new(0, 0, 0, 1, 0))
      screen.insert(Pixel.new(0, 0, 0, 1, 1))

      expect(screen.show_matrix).to eq "[0, 0, 0][0, 0, 0]\n[0, 0, 0][0, 0, 0]\n"
    end
  end
end
