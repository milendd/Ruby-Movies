require 'sinatra/base'

module Sinatra
  module CommonRoute
    def self.registered(app)
      
      app.get '/' do
        erb :'./home/index'
      end
      
      app.get '/search' do
        # TODO:
        @query = params[:query]
        @movies = []
        @people = []
        erb :'./home/search'
      end
    end
  end
  
  register CommonRoute
end
