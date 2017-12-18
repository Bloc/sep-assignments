# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    @members = []
  end

  def join(person)
    @members.push(person)
  end

  def leave(person)
    @members.delete(person)
  end

  def front
    @members[0]
  end

  def middle
    average = (@members.length / 2).floor
    @members[average]
  end

  def back
    @members[-1]
  end

  def search(person)
    person if @members.include?(person)
  end

  private

  def index(person)
  end

end
