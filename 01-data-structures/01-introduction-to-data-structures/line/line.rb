# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    # members[members.size() > 0 ? x.size() -1 : 0] = 6
    self.members[members.size() > 0 ? -1 : 0] = person
  end

  def leave(person)
    self.members.delete(person)
  end

  def front
    self.members[members.first()]
  end

  def middle
    self.members[members.slice(3)]
  end

  def back
    self.members[members.last()]
  end

  def search(person)
    # for loop, check each thing in list, compare with person
    for i in self.members
      if i == person
        person
      end
    end
  end

  private

  def index(person)
    if search(person)
      # find the index of person
      self.members.index(person)
    else
      # otherwise nil else statement
      nil
    end
  end
end
