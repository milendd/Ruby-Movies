require 'sinatra/base'

class MyApp < Sinatra::Base

  get "/hello/:name" do
    "Hello #{params[:name]}!"
  end

end

run MyApp.run!