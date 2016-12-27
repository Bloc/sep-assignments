class HashItem
  attr_accessor :key
  attr_accessor :value

  def initialize(key, value)
    @key = key
    @value = value
  end

  def inspect
    "#{@key.inspect} => #{@value.inspect}"
  end
end
