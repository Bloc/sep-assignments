require_relative 'node'

class OpenAddressing
  def initialize(size)
    @nodes = Array.new(size)
  end

  def []=(key, value)
    placeItem(key, value)
  end

  def [](key)
    startingIndex = index(key, size)
    i = 0
    while (@nodes[startingIndex] != nil) && (@nodes[startingIndex].key != key) && (i <= size)
      startingIndex + 1 == size ? startingIndex = 0 : startingIndex += 1
      i += 1
    end
    i > size ? nil : @nodes[startingIndex].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    "#{key}".sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index, array = @nodes)
    returnIndex = index
    i = 0
    while array[returnIndex] != nil
      if (returnIndex +1) == array.size
        returnIndex = 0
      else
        returnIndex += 1
      end
      i += 1
      if i == array.size
        return -1
      end
    end
    return returnIndex
  end

  # Simple method to return the number of items in the hash
  def size (array = @nodes)
    array.length
  end

  # Resize the hash
  def resize
    placeholderArray = Array.new(@nodes.size * 2)
    @nodes.each do |x|
      if x != nil
        placeItem(x.key, x.value, placeholderArray)
      end
    end
    @nodes = placeholderArray
  end

  def print
    printableArray = []
    storedValues = 0
    @nodes.each do |x|
      if x == nil
        printableArray << [nil, nil]
      else
        printableArray << [x.key, x.value]
        storedValues += 1
      end
    end
    indexValue = 0
    puts "index: key, value"
    printableArray.each do |x|
      puts "#{indexValue}: #{printableArray[indexValue]}"
      indexValue += 1
    end
    puts "load factor: #{storedValues.to_f / size}"
  end

  private

  def placeItem(key, value, array = @nodes)
    placementLocation = next_open_index(index(key, array.size), array)
    if placementLocation == -1
        resize
        placeItem(key, value)
    else
      array[placementLocation] = Node.new(key, value)
    end
  end

end



=begin
  the output for:
    star_wars_movies = OpenAddressing.new(6)
    star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
    star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
    star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
    star_wars_movies["Star Wars: A New Hope"] = "Number Four"
    star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
    star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"

    star_wars_movies.resize
    star_wars_movies.print

  is:
    index: key, value
    0: [nil, nil]
    1: [nil, nil]
    2: ["Star Wars: The Empire Strikes Back", "Number Five"]
    3: ["Star Wars: Return of the Jedi", "Number Six"]
    4: ["Star Wars: Attack of the Clones", "Number Two"]
    5: ["Star Wars: A New Hope", "Number Four"]
    6: ["Star Wars: The Phantom Menace", "Number One"]
    7: [nil, nil]
    8: [nil, nil]
    9: [nil, nil]
    10: [nil, nil]
    11: ["Star Wars: Revenge of the Sith", "Number Three"]
    load factor: 0.5


= end
