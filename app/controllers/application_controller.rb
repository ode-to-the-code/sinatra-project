require './config/environment'
require 'pry'
# each rider can have multiple autpods, which are small bubble-like vehicles which come when summonned and transport individuals around the city.
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    # binding.pry
    # erb :welcome
    erb :index
  end

  # get '/riders/new' do
  #   "Hello World"
  # end

#   get '/riders/logout' do
#   "Hello World"
# end
  # get '/logout' do
  #   "hello!"
  # end



  helpers do

 # this method just extracts the current user at that moment. it's so you don't have to manually write this code and query the database. this method queries the user table.
     def current_user
       @current_user ||= Rider.find_by(id: session[:rider_id]) if session[:rider_id]
     end

     def logged_in?
       !!current_user
     end



 end

end
