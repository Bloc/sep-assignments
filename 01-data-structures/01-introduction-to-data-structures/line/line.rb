# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
    i = 0
    while (i < members.length)
      if (members[i] === person)
        members.delete_at(i)
      end
      i += 1
    end
  end

  def front
    members[0]
  end

  def middle
    middle = ((members.length) / 2).round
    members[middle]
  end

  def back
    members[-1]
  end

  def search(person)
    i = 0
    while (i < members.length)
      if (members[i] === person)
        return person
      end
      i += 1
    end
    return nil
  end

  private

  def index(person)
  end

end