class Node
	attr_accessor :name
	attr_accessor :film_actor_hash

	def initialize(name)
		@name = name
		@film_actor_hash = Hash.new()
	end
end
