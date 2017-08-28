require 'sinatra/base'

class MyApp < Sinatra::Base

  # get "/hello/:name" do
  #   "Hello #{params[:name]}!"
  # end

  get '/' do
    erb :index
  end
end

run MyApp.run!
