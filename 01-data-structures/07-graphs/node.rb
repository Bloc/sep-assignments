class Node
    attr_accessor :type, :name, :links, :id

    def add(link)
        @links << link
    end

    def list
        @links.each {|l| puts l.name}
    end
end

class Actor < Node
    def initialize(name, id)
        @id = id
        @name = name
        @links = []
        @type = :actor
    end
end

class Film < Node
    def initialize(name, id)
        @id = id
        @name = name
        @links = []
        @type = :film
    end
end

class Marker < Node
    def initialize(name, ref)
        @name = name
        @links = []
        @type = :marker
        @ref = ref
    end

    def ref
        @ref
    end
end