require 'sinatra/base'

require_relative '../models/celebrity'
require_relative '../models/celebrities_movie'

module Sinatra
  module CelebritiesRoute
    def self.registered(app)
      
      app.get Regexp.new('\/celebrities\/?') do
        # todo: page size and page count
        @celebrities = Celebrity.all
        erb :'./celebrities/index'
      end
      
      app.get '/celebrities/:id' do
        @celebrity = Celebrity.where(id: params[:id]).first
        @all_data = CelebritiesMovie.where(celebrity_id: params[:id])
        erb :'./celebrities/view'
      end
    end
  end
end
