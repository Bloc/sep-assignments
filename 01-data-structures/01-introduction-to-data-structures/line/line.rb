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
    #members.delete(person)
      #expected nil, got ["Hillary", "Bernie", "Ted", "Jeb", "Ben"]
    #members.delete_at(index(person))
      #expected nil, got ["Hillary", "Bernie", "Ted", "Jeb", "Ben"]
    #self.members.delete_at(index(person))
      #expected nil, got ["Hillary", "Bernie", "Ted", "Jeb", "Ben"]
    #if self.members.delete(person)
      #return nil
    #end
      #expected nil, got ["Hillary", "Bernie", "Ted", "Jeb", "Ben"]

    #got this to work, but not really sure why....once Donald is removed, it checks that position and it is nil??  
    members[index(person)] = nil
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
    #iterate through the array to search for person
    members.each do |individual|
      if person == individual
        return individual
      end
    end
  end

  private

  def index(person)
    members.index(person)
  end

end
