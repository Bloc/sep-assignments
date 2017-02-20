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
		if members.include?(person)
			members.delete(person)
		end
  end

  def front
		members[0]
  end

  def middle
		members[members.length / 2]
  end

  def back
		members[-1]
  end

  def search(person)
		members.find(person)
		if members.include?(person)
			return person
		else
			return nil
		end
  end

  private

  def index(person)
  end

end