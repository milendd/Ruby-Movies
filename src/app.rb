require 'sinatra/base'
require 'sinatra/activerecord'

require_relative  'routes/common_route'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::CommonRoute
  
  set :database, { adapter: 'sqlite3', database: 'db/database.sqlite' }

  # get "/hello/:name" do
  #   "Hello #{params[:name]}!"
  # end
end
