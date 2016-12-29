# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.

# print "What is your name? "
# name = gets.chomp
# puts "Hello #{name}!"


class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
    members.delete(person)
  end

  def front
    members[0]
  end

  def middle
    mid = members.length / 2
    members[mid]
  end

  def back
    members.last
  end

  def search(person)
    if members.include? person
      return person
    end
  end

  private

  def index(person)
  end

end
