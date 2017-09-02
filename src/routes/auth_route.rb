require 'sinatra/base'

require_relative '../models/user'

module Sinatra
  module AuthRoute
    def self.registered(app)
      app.enable :sessions
      
      # add condition, like :auth => :user
      app.register do
        def auth(type)
          condition do
            redirect "/login/not_auth" unless send("is_#{type}?")
          end
        end
      end
      
      app.helpers do
        def user?
          @user != nil
        end
        
        def admin?
          @user && @user.is_admin
        end
      end
      
      app.before do
        @user = User.where(id: session[:user_id]).first
      end
      
      app.get '/login/not_auth' do
        @error = 'You are not authorized to see that page'
        erb :'./home/login'
      end

      app.get Regexp.new('\/login\/?') do
        redirect '/' if user?
        erb :'./home/login'
      end

      app.post Regexp.new('\/login\/?') do
        redirect '/' if user?

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
        redirect '/' if user?
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
