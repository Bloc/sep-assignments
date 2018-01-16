# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    @members = []
  end

  def join(person)
    @members << person
  end

  def leave(person)
    index = @members.index(person)
    @members.delete_at(index)
  end

  def front
    @members[0]
  end

  def middle
    middle_index = (@members.length/2.to_f).ceil
    @members[middle_index]
  end

  def back
    @members[-1]
  end

  def search(person)
    if @members.include?(person)
      person
    else
      nil
    end
  end

end
