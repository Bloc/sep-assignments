def find_kevin_bacon(first_actor)
  counter = 0
  array = []
  if find_actor == "Kevin Bacon"
    return array
  end
  first_actor.each do |movie|
    if first_actor.actor_hash[title].any?{ |actor| actor == Kevin_Bacon}
      array << movie_title
      find_kevin_bacon(Kevin_Bacon)
    else
      if counter < 7
        first_actor.actor_hash[title].each do |actor|
          counter += 1
          array << movie_title
          find_kevin_bacon(actor)
        end
      else
        counter = 0
        array = []
      end
    end
  end
end
