require_relative 'hashclass'

hash = HashClass.new(6)


def print_hash(hash)
  hash.each do |item|
    if item != nil
      puts "Key:#{item[0]}, Value: #{item[1]}"
    end
  end
end




hash["A New Hope"] = "Average"
puts "1 item added at size #{hash.size}"
print_hash(hash.items)

hash["Empire Strikes Back"] = "Excellent"
puts "2 items added at size #{hash.size}"
print_hash(hash.items)

hash["Return of the JediReturn of the Jedi"] = "The Best"
puts "3 items added at size #{hash.size}"
print_hash(hash.items)

hash["LOTRLOTRLOTRLOTRLOTRLOTR"] = "cool"
puts "4 items added at size #{hash.size}"
print_hash(hash.items)

hash["Fellowship"] = "awesome"
puts "5 items added at size #{hash.size}"
print_hash(hash.items)


puts "6 items added at size #{hash.size}"
hash["The Lord of the Rings: The Fellowship of the Ring"] = "3 hours, 48 minutes"
print_hash(hash.items)
puts hash["The Lord of the Rings: The Fellowship of the Ring"].eql?("3 hours, 48 minutes")
