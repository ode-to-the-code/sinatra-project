class RidersController < ApplicationController

    get '/riders/new' do
      "hello world"
    end

    get '/riders/signup' do
      if session[:rider_id]
        # binding.pry
        redirect "/autopods"
      else
        redirect "riders/new"
      end
  end

  post '/signup' do
      # binding.pry
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      # binding.pry
      @user = Rider.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @rider.save
        # binding.pry
        session[:rider_id] = @rider.id
    else
      redirect '/signup'
    end
    #create session id
    if @rider.save
        redirect '/autopods'
   end
    # if signup doesn't work, then send them back to signup
  end





end
