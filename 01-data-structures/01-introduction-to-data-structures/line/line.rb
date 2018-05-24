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
    members.delete_at(index(person))
  end

  def front
    members[0]
  end

  def middle
    mid_index = ((members.length)/2).floor
    members[mid_index]
  end

  def back
    members[members.length - 1]
  end

  def search(person)
    members.each do |member|
      if member == person
        return member
      end
    end
    nil
  end

  private

  def index(person)
    members.each_with_index do |member, index|
      if member == person
        return index
      end
    end
  end
end
