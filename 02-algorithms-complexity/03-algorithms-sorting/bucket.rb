class Bucket

attr_accessor :min
attr_accessor :max
attr_accessor :data

  def initialize(min, max)
    @min = min
    @max = max
    @data = []
  end

end
