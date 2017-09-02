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
      
      app.get '/movies/add', auth: 'admin' do
        @actors = Celebrity.all
        @movie = Celebrity.new
        erb :'./movies/edit'
      end
      
      app.post '/movies/edit', auth: 'admin' do
        @movie = 
          if params[:id] || params[:id].empty?
            Movie.new
          else
            Movie.find(params[:id])
          end
        
        @movie.title = params[:title]
        @movie.year = params[:year].to_i
        @movie.duration = params[:duration].to_i
        @movie.description = params[:description]
        @movie.genre = params[:genre]
        
        # todo: add actors
        if @movie.year > 0 && @movie.duration > 0 && @movie.title && @movie.title != ''
          @movie.save
          redirect '/movies'
        else
          @error = 'Title, duration and year are required'
          erb :'./movies/edit'
        end
      end
      
      app.get '/movies/delete/:id', auth: 'admin' do
        all_celebrities = CelebritiesMovie.where(movie_id: params[:id])
        
        all_celebrities.each do |celebrity|
          celebrity.destroy
        end
        Movie.destroy(params[:id])
        
        redirect '/movies'
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
