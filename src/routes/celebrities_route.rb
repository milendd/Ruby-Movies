require 'sinatra/base'

require_relative '../models/celebrity'

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
        erb :'./celebrities/view'
      end
    end
  end
end
