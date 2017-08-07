# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize # initially, no members
    self.members = []
  end

  def join(person) # add person to the back of the line
    self.members.push(person)
  end

  def leave(person) # remove person from middle of the line
    self.members.delete(person) 
  end

  def front # the person at the front of the line
    self.members[0]
  end

  def middle # the person in the middle of the line
    midpoint = self.members.length/2
    return self.members[midpoint]
  end

  def back # the person at the back of the line
    return self.members[-1] # if the length of the list is L, then self.members[L-1] is the same as self.members[-1]
  end

  def search(person) # returns the person if he's in the line, nil otherwise
    return person if self.members.include? person
    # else return nil
  end

  private

  def index(person) # returns the index of the person in the line
    return self.members.index(person)
  end

end