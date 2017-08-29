require 'sinatra/base'

module Sinatra
  module CommonRoute
    def self.registered(app)
      app.get '/' do
        erb :'./home/index'
      end
    end
  end
  
  register CommonRoute
end
