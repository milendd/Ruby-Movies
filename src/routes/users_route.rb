require 'sinatra/base'

require_relative '../models/user'

module Sinatra
  module UsersRoute
    def self.registered(app)
      
      app.get '/users' do
        @users = User.all
        erb :'./users/index'
      end
      
      app.get '/users/:id' do
        @user = User.find(params[:id])
        erb :'./users/view'
      end
    end
  end
  
  register UsersRoute
end
