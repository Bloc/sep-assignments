class Film
  attr_accessor :name
  attr_accessor :actors

  def initialize(name)
    @name = name
    @actors = []
  end
end
