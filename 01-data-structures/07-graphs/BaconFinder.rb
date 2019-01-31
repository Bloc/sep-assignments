include 'node'

class BaconFinder
  attr_accessor :visited

  def find_kevin_bacon(actor)
    films = []
    @visited << actor

    actor.film_actor_hash do |title, actors|
      actors.each do |a|
        if a == "Kevin Bacon"
          films << title
          if !@visited.include?(a)
            temp = find_kevin_bacon(a)
            films << title #<< is adding a string to array
            films += temp #+= mathematical equation addd an array to an array (resulting in just one single array without nested arrays)
          end
        end
      end
    end
    (films.length <= 6 && films.length > 0) ? (puts "Connected by films: #{films.all}") : (puts "Not connected by 6 or less films")
  end
end

#Function:
#1. create a class called the BaconFinder
#2. have the ruby method, attr_accessor - which will automatically set up getters and setters for the instance variable :visited
#3. define the method 'find_kevin_bacon' with the parameter of actor
#4. set an empty array to 'films'
#5. in the method find_kevin_bacon, **add every parameter** that is passed through it, to the instance variable :visited
#6. in line10, we see that each actor has a method attached to it called, film_actor_hash
#7. on the object 'actor.film_actor_hash', start a loop with the block parameters: (1)title (2)actors (|title, actors|)
#8. run a loop inside of the object 'actor.film_actor_hash', on the object 'actors.each', that will have a single block parameter |a|
#9. actors.each |a| means the block parameter |a| allows the searching through every item in the previous block parameter | --, actors|
#10. question = does the parameter block |a| equal 'Kevin Bacon' in any of these 'film_actor_hash's?
#11. if yes, add that specific title to our empty array 'films'

#('films' = only titles with 'Kevin Bacon' - present as one of the actors!)
#('visited' = every single actor parameter passed to the method find_kevin_bacon!)

#12. start an if loop, immediately check every single item in the 'visited' array.(which is every parameter we've passed in the method from the beginning'find_kevin_bacon')
#13. if those names != 'Kevin Bacon'
#14. run the recusion method again passing that name (that isn't 'Kevin Bacon') as the parameters, 
#15. which will grab that specific title, then set the variable 'temp' to equal those values of those titles

#16. add titles, (w/out 'Kevin Bacon'), to array 'films'
#17. add temp to films - *Isn't ths the same as #16^?*

#(we've added all the titles with name 'Kevin Bacon' to our empty array films)
#(now we're adding all the names that did not include 'Kevin Bacon' to our empty array films)





