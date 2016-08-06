# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members << person
  end

  def leave(person)
    members[index(person)] = nil
  end

  def front
    members.first
  end

  def middle
    members[members.length/2]
  end

  def back
    members.last
  end

  def search(person)
    idx = index(person)
    idx ? self.members[idx] : nil
  end

  private

  def index(person)
    self.members.index(person)
  end

end
