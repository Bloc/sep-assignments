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
    members.delete(person)
  end

  def front
    members.first
  end

  def middle
    middle_index = (members.length / 2).round
    members[middle_index]
  end

  def back
    members.last
  end

  def search(person)
    members.bsearch { |x| x == person }
  end

  private

  def index(person)
  end

end
