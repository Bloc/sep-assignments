# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members.push(person)
  end

  def leave(person)
    self.members.slice!(index(person))
  end

  def front
    self.members[0]
  end

  def middle
    self.members[((members.length / 2 ).round)]
  end

  def back
    self.members[-1]
  end

  def search(person)
    self.members.include?(person) ? person : nil
  end

  private

  def index(person)
    self.members.index(person)
  end

end
