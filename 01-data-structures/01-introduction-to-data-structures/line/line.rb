# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person);
  end

  def leave(person)
    members.delete(person);
  end

  def front
    if members.empty? == true
      p "nobody is in line at this time"
    else
      p "#{members.first}"
    end
  end

  def middle
    if members.empty? == true
      puts "nobody is in line at this time"
    elsif members.length % 2 == 1
      p "#{members[(members.length) / 2]} is in the middle of the line";
    else
      p "#{members[(members.length) / 2]} and #{members[((members.length) / 2) + 1]} are both in the middle";
    end
  end

  def back
    if members.empty? == true
      p "nobody is in line at this time"
    else
      p "#{members.last}"
    end
  end

  def search(person)
    if members.include?(person) == true
      p "#{person}"
    end
  end

  private

  def index(person)
    members.index(person);
  end

end
