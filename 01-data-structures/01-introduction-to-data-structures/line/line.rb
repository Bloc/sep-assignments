# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    if self.members.include?(person) == false
      self.members.push(person)
    end
  end

  def leave(person)
     indexNumber = index(person)
     if indexNumber != nil
       self.members.slice!(indexNumber)
     end
  end

  def front
    return self.members[0]
  end

  def middle
    if self.members.length > 2
      return self.members[(self.members.length / 2).floor]
    else
      return nil
    end
  end

  def back
    return self.members[-1]
  end

  def search(person)
    if self.members.include?(person)
      return person
    end
  end

  private

  def index(person)
    return self.members.index(person)
  end

end
