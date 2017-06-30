require_relative 'node'
require_relative 'data_set'

system 'clear'

class Bacon
    include DataSet

    def initialize
        DataSet.populate
    end

    def print(chain)
        i = 0
        while chain[i+2]
            puts "#{chain[i].name} was in #{chain[i+1].name} with #{chain[i+2].name}"
            i+= 2
        end
    end

    def find_kevin(name, target_name = "Kevin Bacon")
        # gen 0
        return puts "You gave me #{target_name}" if name == target_name
        return puts "#{name} was not found in our database" unless node = DataSet.players[name]
        return puts "#{target_name} was not found in our database" unless target = DataSet.players[target_name]

        node_chain = [node]
        target_chain = [target]

        node_actors = [node]
        node_films = []
        
        target_actors = [target]
        target_films = []

        for i in 1..6 do 
            node_actors.each do |a|
                a.links.each do |f|
                    node_films << f unless node_films.include? f
                end
                node_films << Marker.new("*** #{a.name}\n\n",a) unless node_films.last.is_a? Marker
            end
            node_films.each do |f|
                f.links.each do |a|
                    node_actors << a unless node_actors.include? a
                    if a == target
                        target_chain.unshift(f) 
                        until target_chain.first == node
                            ( target_chain.first.is_a? Actor ) ? db = node_actors : db = node_films
                            p = db.index(target_chain.first)
                            p += 1 until db[p].is_a? Marker
                            target_chain.unshift(db[p].ref)
                        end
                        print(target_chain)
                        return
                    end
                end
                node_actors << Marker.new("*** #{f.name}\n\n", f) unless node_actors.last.is_a? Marker
            end
        end
        return puts "No path was found between #{node.name} and #{target.name}"
    end
end