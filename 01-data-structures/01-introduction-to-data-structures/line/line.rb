# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members << person
  end

  def leave(person)
    #attempt #1
    #REMEMEBER: POP removes LAST person, line_spec.rb *DOESNT* say "last person"

    #attempt #2
    members.delete(person)
    # => expected: nil got: "That person does not exist in the line"
    #WORKS! // after updating method #search

    #attempt #3
    #@members.delete(person)
    #WORKS! // after updating method #search

    #attempt #4
    #self.members.delete(person)
    # => expected: nil got: "That person does not exist in the line"
    #WORKS! // after updating method #search

    #attempt #5
    #members.delete_if person.include?
    # => wrong number of arguments (given 0, expected 1)
    #members.include?(person)
    #DOESNT WORK // after updating method #search

    #attempt #6
    #return nil if members.delete(person) == true
    # => expected: nil got: "That person does not exist in the line"
    #WORKS! // after updating method #search

    #attempt #7
    #self.members.slice!(self.members.index(person))
    # slice! deletes the elements given by an idex
    #WORKS! // after updating method #search

  end

  def front
    #1 way
    members[0] ? members[0] : nil
    #WORKS!

    #2nd way
    #members[0] unless members[0] == nil
    #WORKS!

    #3rd way
    #members.first
    #WORKS!
  end

  def middle
    #attempt #1
    #line = members.length
    #center = line/2
    #line.even? ? (members[center] + members[center + 1])/2 : members[center]
    # => got undefined /

    #attempt #2
    #(members[(members.length/2) - 1] + members[members.length/2]) / 2.to_f
    # => got 3

    #attempt #3
    center = members.length / 2
    members[center]
    #WORKS!
  end

  def back
    members.last
  end

  def search(person)
    #members.include?(person) ? person : "That person does not exist in the line"
    #Had to update for the method #leave

    members.include?(person) ? person : nil
    #IMPORTANT
    #The method #leave needs the second half of this condition to read "nil" to pass rspecs!!!!
  end

  private

  def index(person)
    members.index(person)
  end

end