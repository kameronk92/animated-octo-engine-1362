require "rails_helper"

RSpec.describe Movie, type: :model do
    describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :actor_movies}
    it {should have_many(:actors).through(:actor_movies)}
  end

  before(:each) do
    @studio1 = Studio.create(name: "Lucasfilm", location: "Burbank, CA")
    @studio2 = Studio.create(name: "Conaco", location: "Hollywood, CA")
    @movie1 = @studio1.movies.create(title: "Star Wars", creation_year: "1977", genre: "Sci-fi")
    @movie2 = @studio1.movies.create(title: "Indiana Jones", creation_year: "1981", genre: "Adventure")
    @movie3 = @studio2.movies.create(title: "Hans and Frans Big Adventure", creation_year: "1993", genre: "Comedy")
    @movie4 = @studio2.movies.create(title: "The Year 2000", creation_year: "2003", genre: "Comedy")
    @actor1 = Actor.create(name: "Mark Hammil", age: 27)
    @actor2 = Actor.create(name: "Arnold Swarzenneger", age: 25)
    @actor3 = Actor.create(name: "Meryl Streep", age: 27)

    ActorMovie.create(actor: @actor1, movie: @movie3)
    ActorMovie.create(actor: @actor2, movie: @movie3)
  end

  describe "#actors_list" do
    it "lists the actors by name who were in a movie" do
      expect(@movie3.actors_list).to eq([@actor2.name, @actor1.name])
    end
  end

  describe "#cast_age" do
    it "averages the age of all actors on a given movie" do
      expect(@movie3.cast_age).to eq(26)
    end
  end
end
