require 'sinatra/base'
require 'sinatra/activerecord'

require_relative  'routes/common_route'
require_relative  'routes/users_route'
require_relative  'routes/movies_route'

class App < Sinatra::Base
  
  register Sinatra::ActiveRecordExtension
  register Sinatra::CommonRoute
  register Sinatra::UsersRoute
  register Sinatra::MoviesRoute
  
  set :database, { adapter: 'sqlite3', database: 'db/database.sqlite' }

  # get "/hello/:name" do
  #   "Hello #{params[:name]}!"
  # end
end
