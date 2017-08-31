require 'sinatra/base'

require_relative '../models/user'

module Sinatra
  module UsersRoute
    def self.registered(app)
      
      app.get '/users' do
        # todo: page size and page count
        @users = User.all
        erb :'./users/index'
      end
      
      app.get '/users/:id' do
        @user = User.where(id: params[:id]).first
        erb :'./users/view'
      end
    end
  end
end
