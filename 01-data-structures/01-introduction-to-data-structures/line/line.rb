# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members.push(person);
  end

  def leave(person)
    if self.members.include?(person)
      arrayIndex = self.members.delete(person)
    else
      puts("Sorry there wasn't a person in line with that name")
    end
  end

  def front
    self.members[0]
  end

  def middle
    middlePerson = 0
    length = self.members.length

    middlePerson = (length / 2).truncate

    self.members[middlePerson]
  end

  def back
    last = self.members.length - 1

    self.members[last]
  end

  def search(person)
    if self.members.include?(person)
      person
    else
      puts("Sorry that person might be in another line.")
    end
  end

  private

  def index(person)
    self.members.index(person)
  end

end
