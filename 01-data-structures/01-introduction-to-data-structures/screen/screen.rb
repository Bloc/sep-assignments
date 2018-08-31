require_relative 'pixel'
require 'matrix'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width = 0, height = 0)
    self.width = width
    self.height = height

    @matrix = Array.new
    (0..height).each do |j|
      @matrix[j] = Array.new
      (0..width).each do |i|
        @matrix[j][i] = nil
      end
    end
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    return nil if x > self.width || y > self.height
    @matrix[x][y] = pixel
  end

  def at(x, y)
    return @matrix[x][y]
  end

end