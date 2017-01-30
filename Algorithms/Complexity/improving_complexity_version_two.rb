# Different data structure, hash, that saves time using more data space

def saveTime_written_ruby(*arrays)
  return nil if arrays.empty?
  combined_array = arrays.flatten

  convert_datatohash = {}

  # convert array into hash data structure, key is 0-combined_array.length & value is index values
  # sorting isn't needed
  combined_array.each_with_index  do |v, i|
    convert_datatohash[i] = v
  end
  convert_datatohash[:smallest] = combined_array.min #store smallest
  convert_datatohash[:largest] = combined_array.max #store largest

  convert_datatohash

end
