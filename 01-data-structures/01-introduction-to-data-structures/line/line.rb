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
    members.reject! { |item|
      item == person
    }
  end

  def front
    members[0]
  end

  def middle
    members[members.size / 2]
  end

  def back
    members.last
  end

  def search(person)
    if members.include?(person)
      person
    end
  end

  private

  def index(person)
  end

end
