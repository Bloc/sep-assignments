# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members << person
  end

  def leave(person)
    self.members.delete(person)
  end

  def front
    return self.members[0]
  end

  def middle
    return self.members[self.members.length/2]
  end

  def back
    return self.members[-1]
  end

  def search(person)
    self.members.each {|k| return k if k == person }
    return nil
  end

  private

  def index(person)
    return self.members.index { |i| i === person}
  end

end