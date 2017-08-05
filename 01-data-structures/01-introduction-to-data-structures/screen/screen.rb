require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix
  attr_accessor :foo

  #def initialize(width, height)
  #   self.width = width
  #   self.height = height
  #   self.matrix = []
  #   (0...self.height).each do |y|
  #     row = []
  #     self.matrix.push(row)
  #     (0...self.width).each do |x|
  #       row.push nil
  #     end
  #   end
    
  # end
  
  def initialize(width, height)
    self.matrix = []
    self.width = width
    self.height = height
    (0...height).each do |y|
      row = []
      (0...width).each do |x|
        row.push nil
      end 
      self.matrix.push(row)
    end
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)     
      row = self.matrix[y]
      row[x] = pixel
    end
  end

  def at(x, y)
    if inbounds(x,y)
      row = self.matrix[y]
      return row[x]
    end
  end

  private

  def inbounds(x, y)
    x < self.width && y < self.height && x >= 0 && y >= 0
  end

end