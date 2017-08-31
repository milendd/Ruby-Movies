require 'sinatra/base'

require_relative '../models/movie'

module Sinatra
  module MoviesRoute
    def self.registered(app)
      
      app.get '/movies' do
        # todo: page size and page count
        @movies = Movie.all
        erb :'./movies/index'
      end
      
      app.get '/movies/:id' do
        @movie = Movie.where(id: params[:id]).first
        erb :'./movies/view'
      end
    end
  end
end
