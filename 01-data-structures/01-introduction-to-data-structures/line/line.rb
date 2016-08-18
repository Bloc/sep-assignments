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
    #or use shovel operator <<
  end

  def leave(person)
    members.delete(person)
  end

  def front
    members[0]
    #or members.first
  end

  def middle
    #divide array in half
    calculate_middle = members.length/2
    #use modulus to determine if array is even or odd
    if members.length % 2 == 0
      #run calculate_middle method on members array
      members[calculate_middle]
    #if array is odd then we need to round answer and subtract 1 to find the middle postion in array
    else
      #run calculate_middle, use round method and subtract one positon in array
      members[calculate_middle.round - 1]
    end
  end

  def back
    members[-1]
    #or members.last
  end

  def search(person)
    members.include?(person)
    return person
  end

  private

  def index(person)
  end

end
