require 'sinatra/base'

require_relative '../models/user'

module Sinatra
  module AuthRoute
    def self.registered(app)
      app.enable :sessions

      app.get Regexp.new('\/login\/?') do
        redirect '/' if session[:user_id]
        erb :'./home/login'
      end

      app.post Regexp.new('\/login\/?') do
        redirect '/' if session[:user_id]

        @db_user = User.authenticate(params[:username], params[:password])
        if @db_user.nil?
          @error = 'Incorrect username or password'
          erb :'./home/login'
        else
          session[:user_id] = @db_user.id
          redirect '/'
        end
      end

      app.get Regexp.new('\/logout\/?') do
        session.clear
        redirect '/'
      end
    end
  end
end
