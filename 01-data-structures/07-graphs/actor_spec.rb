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
      xmen.add_actor_to_film(kevin_bacon)
      xmen.add_actor_to_film(jennifer_lawrence)
      xmen.add_actor_to_film(james_mcavoy)
      expect(film.actors).to eq ["Kevin Bacon", "Jennifer Lawrence", "James McAvoy"]
    end
  end

  describe "#film_actor_hash(film)" do
    it "prints out a list of the other actors in the film" do
      xmen.add_actor_to_film(kevin_bacon)
      xmen.add_actor_to_film(jennifer_lawrence)
      xmen.add_actor_to_film(james_mcavoy)
      expect(kevin_bacon.film_actor_hash(xmen)).to eq ["Jennifer Lawrence", "James McAvoy"]
    end
  end

  describe "#find_kevin_bacon" do
    it "links to Kevin Bacon in 6 movies or less" do
      xmen.add_actor_to_film(kevin_bacon)
      xmen.add_actor_to_film(jennifer_lawrence)
      xmen.add_actor_to_film(james_mcavoy)

      hunger.add_actor_to_film(jennifer_lawrence)
      hunger.add_actor_to_film(josh_hutcherson)
      hunger.add_actor_to_film(liam_hemsworth)

      independence.add_actor_to_film(liam_hemsworth)
      independence.add_actor_to_film(jeff_goldblum)
      independence.add_actor_to_film(bill_pullman)

      thor.add_actor_to_film(jeff_goldblum)
      thor.add_actor_to_film(cate_blanchett)
      thor.add_actor_to_film(tessa_thompson)

      expect(cate_blanchett.find_kevin_bacon).to eq "Thor: Ragnarok, Independence Day: Resurgence, The Hunger Games, X-Men: First Class"
    end

    it "will fail to print link if it takes more than 6 films" do
      xmen.add_actor_to_film(kevin_bacon)
      xmen.add_actor_to_film(jennifer_lawrence)
      xmen.add_actor_to_film(james_mcavoy)

      hunger.add_actor_to_film(jennifer_lawrence)
      hunger.add_actor_to_film(josh_hutcherson)
      hunger.add_actor_to_film(liam_hemsworth)

      independence.add_actor_to_film(liam_hemsworth)
      independence.add_actor_to_film(jeff_goldblum)
      independence.add_actor_to_film(bill_pullman)

      thor.add_actor_to_film(jeff_goldblum)
      thor.add_actor_to_film(cate_blanchett)
      thor.add_actor_to_film(tessa_thompson)

      creed.add_actor_to_film(tessa_thompson)
      creed.add_actor_to_film(sylvester_stallone)
      creed.add_actor_to_film(michael_b_jordon)

      fantastic.add_actor_to_film(michael_b_jordon)
      fantastic.add_actor_to_film(kate_mara)
      fantastic.add_actor_to_film(miles_teller)

      shooter.add_actor_to_film(kate_mara)
      shooter.add_actor_to_film(mark_wahlberg)
      shooter.add_actor_to_film(rhona_mitra)

      expect(rhona_mitra.find_kevin_bacon).to eq "It took more than 6 films to find Kevin Bacon."
    end
  end
end
