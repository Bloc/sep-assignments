class Element
  include Comparable
  attr_accessor :title, :rating

  def initialize(title, rating)
    @title = title
    @rating = rating
  end

  def <=>(other)
    @rating <=> other.rating
  end
end
