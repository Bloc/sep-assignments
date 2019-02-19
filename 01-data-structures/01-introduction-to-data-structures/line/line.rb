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
    self.members.delete_at(index(person))
    puts self.members
  end

  def front
    self.members.first
  end

  def middle
    index = (self.members.length/2).floor
    self.members[index]
  end

  def back
    self.members.last
  end

  def search(person)
    person_index = index(person)
    self.members[index(person)] if !person_index.nil?
  end

  private

  def index(person)
    self.members.index { |p| p == person }
  end

end
