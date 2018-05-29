# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_reader :members

  def initialize
    self.members = []
  end

  def join(person)
	self.members << person
  end

  def leave(person)
	self.members.delete(person)
  end

  def front
	self.members.first
  end

  def middle
	if (self.members.length % 2 == 0)
		median = self.members.length / 2
	else
		median = (self.members.length + 1) / 2
	end
	self.members[median]
  end

  def back
	self.members.last
  end

  def search(person)
	self.members.bsearch {|i| i == person}
  end

  private

  def index(person)
	
  end

end