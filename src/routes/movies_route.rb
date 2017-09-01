require 'sinatra/base'

require_relative '../models/movie'
require_relative '../models/celebrities_movie'
require_relative '../models/celebrity_type'

module Sinatra
  module MoviesRoute    
    def self.registered(app)
      app.before do
        @actor_type = CelebrityType.where(name: 'Actor').first.id
        @director_type = CelebrityType.where(name: 'Director').first.id
        @author_type = CelebrityType.where(name: 'Author').first.id
      end
      
      app.get Regexp.new('\/movies\/?') do
        # todo: page size and page count
        @movies = Movie.all
        erb :'./movies/index'
      end
      
      app.get '/movies/:id' do
        all_data = CelebritiesMovie.where(movie_id: params[:id])
        
        @movie = Movie.where(id: params[:id]).first
        @director = all_data.where(celebrity_type: @director_type).first
        @writers = all_data.where(celebrity_type: @author_type)
        @actors = all_data.where(celebrity_type: @actor_type)
        
        erb :'./movies/view'
      end
    end
  end
end
