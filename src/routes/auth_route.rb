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

      app.get Regexp.new('\/register\/?') do
        redirect '/' if session[:user_id]
        erb :'./home/register'
      end

      app.post Regexp.new('\/register\/?') do
        if params[:password] != params[:confirm_password]
          @error = 'Both passwords should be equal'
          return erb :'./home/register'
        end

        @created_user = User.register(params)
        if @created_user.nil?
          @error = 'Error while saving user'
          erb :'./home/register'
        else
          session[:user_id] = @created_user.id
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
