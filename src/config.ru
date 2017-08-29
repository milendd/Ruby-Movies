require 'sinatra/base'

require_relative  'routes/common_route'

class BaseController < Sinatra::Base
  register Sinatra::CommonRoute
  # get "/hello/:name" do
  #   "Hello #{params[:name]}!"
  # end
end

run BaseController.run!
