include RSpec

require_relative 'actor'
require_relative 'film'

RSpec.describe Actor, type: Class do

  # list of movies
  let (:xmen) { Film.new("X-Men: First Class") }
  let (:hunger) { Film.new("The Hunger Games") }
  let (:independence) { Film.new("Independence Day: Resurgence") }
  let (:thor) { Film.new("Thor: Ragnarok") }
  let (:creed) { Film.new("Creed") }
  let (:fantastic) { Film.new("Fantastic Four") }
  let (:shooter) { Film.new("Shooter") }



  # list of actors
  let(:kevin_bacon) { Actor.new("Kevin Bacon") }
  let(:jennifer_lawrence) { Actor.new("Jennifer Lawrence") }
  let(:james_mcavoy) { Actor.new("James McAvoy") }
  let(:josh_hutcherson) { Actor.new("Josh Hutcherson") }
  let(:liam_hemsworth) { Actor.new("Liam Hemsworth") }
  let(:jeff_goldblum) { Actor.new("Jeff Goldblum") }
  let(:bill_pullman) { Actor.new("Bill Pullman") }
  let(:cate_blanchett) { Actor.new("Cate Blanchett") }
  let(:tessa_thompson) { Actor.new("Tessa Thompson") }
  let(:sylvester_stallone) { Actor.new("Sylvester Stallone") }
  let(:michael_b_jordon) { Actor.new("Michael B. Jordan") }
  let(:kate_mara) { Actor.new("Kate Mara") }
  let(:miles_teller) { Actor.new("Miles Teller") }
  let(:mark_wahlberg) { Actor.new("Mark Wahlberg") }
  let(:rhona_mitra) { Actor.new("Rhona Mitra") }


  describe "#add_actor_to_film(film)" do
    it "adds the actor to the list of actors" do
      kevin_bacon.add_actor_to_film(xmen)
      jennifer_lawrence.add_actor_to_film(xmen)
      james_mcavoy.add_actor_to_film(xmen)
      expect(xmen.actors.name).to eq ["Kevin Bacon", "Jennifer Lawrence", "James McAvoy"]
    end
  end

  describe "#film_actor_hash(film)" do
    it "prints out a list of the other actors in the film" do
      kevin_bacon.add_actor_to_film(xmen)
      jennifer_lawrence.add_actor_to_film(xmen)
      james_mcavoy.add_actor_to_film(xmen)
      expect(kevin_bacon.film_actor_hash(xmen)).to eq ["Jennifer Lawrence", "James McAvoy"]
    end
  end

  describe "#find_kevin_bacon" do
    it "links to Kevin Bacon in 6 movies or less" do
      kevin_bacon.add_actor_to_film(xmen)
      jennifer_lawrence.add_actor_to_film(xmen)
      james_mcavoy.add_actor_to_film(xmen)

      jennifer_lawrence.add_actor_to_film(hunger)
      josh_hutcherson.add_actor_to_film(hunger)
      liam_hemsworth.add_actor_to_film(hunger)

      liam_hemsworth.add_actor_to_film(independence)
      jeff_goldblum.add_actor_to_film(independence)
      bill_pullman.add_actor_to_film(independence)

      jeff_goldblum.add_actor_to_film(thor)
      cate_blanchett.add_actor_to_film(thor)
      tessa_thompson.add_actor_to_film(thor)

      expect(cate_blanchett.find_kevin_bacon).to eq "Thor: Ragnarok, Independence Day: Resurgence, The Hunger Games, X-Men: First Class"
    end

    it "will fail to print link if it takes more than 6 films" do
      kevin_bacon.add_actor_to_film(xmen)
      jennifer_lawrence.add_actor_to_film(xmen)
      james_mcavoy.add_actor_to_film(xmen)

      jennifer_lawrence.add_actor_to_film(hunger)
      josh_hutcherson.add_actor_to_film(hunger)
      liam_hemsworth.add_actor_to_film(hunger)

      liam_hemsworth.add_actor_to_film(independence)
      jeff_goldblum.add_actor_to_film(independence)
      bill_pullman.add_actor_to_film(independence)

      jeff_goldblum.add_actor_to_film(thor)
      cate_blanchett.add_actor_to_film(thor)
      tessa_thompson.add_actor_to_film(thor)

      tessa_thompson.add_actor_to_film(creed)
      sylvester_stallone.add_actor_to_film(creed)
      michael_b_jordon.add_actor_to_film(creed)

      michael_b_jordon.add_actor_to_film(fantastic)
      kate_mara.add_actor_to_film(fantastic)
      miles_teller.add_actor_to_film(fantastic)

      kate_mara.add_actor_to_film(shooter)
      mark_wahlberg.add_actor_to_film(shooter)
      rhona_mitra.add_actor_to_film(shooter)

      expect(rhona_mitra.find_kevin_bacon).to eq "It took more than 6 films to find Kevin Bacon."
    end
  end
end
