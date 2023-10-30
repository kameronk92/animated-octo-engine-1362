class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @actor = Actor.find(params[:actor_id])
    @movie.actors << @actor
  end
end