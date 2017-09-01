require 'sinatra/base'

require_relative '../models/user'

module Sinatra
  module UsersRoute
    def self.registered(app)
      
      app.get Regexp.new('\/users\/?'), :auth => :user do
        # todo: page size and page count
        @users = User.all
        erb :'./users/index'
      end
      
      app.get '/users/:id', :auth => :user do
        @user = User.where(id: params[:id]).first
        erb :'./users/view'
      end
    end
  end
end
