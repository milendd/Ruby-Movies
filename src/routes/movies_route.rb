require 'sinatra/base'

require_relative '../models/movie'
require_relative '../models/celebrities_movies'
require_relative '../models/celebrity_type'

module Sinatra
  module MoviesRoute
    def self.init
      @actor_type_id = CelebrityType.where(name: 'Actor').first.id
      @director_type_id = CelebrityType.where(name: 'Director').first.id
    end
    
    def self.registered(app)
      app.get '/movies' do
        # todo: page size and page count
        @movies = Movie.all
        erb :'./movies/index'
      end
      
      app.get '/movies/:id' do
        MoviesRoute.init
        @all_data = CelebritiesMovies.where(movies_id: params[:id])
        if @all_data.any?
          @movie = Movie.where(id: params[:id]).first
        end
        erb :'./movies/view'
      end
    end
  end
end
