# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    @members.push(person)
  end

  def leave(person)
    @members.delete(person)
  end

  def front
    return @members.first 
  end

  def middle
    center = @members.length/2
    return @members[center]
  end

  def back
    return @members.last 
  end

  def search(person)
    result = @members.find{|member| member.include?(person)}
    return result 
  end

  private

  def index(person)
  end

end
