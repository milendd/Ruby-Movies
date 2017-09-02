require 'sinatra/base'
require 'sinatra/activerecord'

require_relative  'routes/common_route'
require_relative  'routes/users_route'
require_relative  'routes/movies_route'
require_relative  'routes/celebrities_route'
require_relative  'routes/auth_route'

class App < Sinatra::Base
  # register db
  register Sinatra::ActiveRecordExtension
  set :database, { adapter: 'sqlite3', database: 'db/database.sqlite' }
  
  # register common routes
  register Sinatra::AuthRoute
  register Sinatra::CommonRoute
  
  # register specific routes
  register Sinatra::UsersRoute
  register Sinatra::MoviesRoute
  register Sinatra::CelebritiesRoute
end
