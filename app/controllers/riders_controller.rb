class RidersController < ApplicationController

    get '/riders/new' do
      # "hello world"
      erb :'riders/new'
    end


    get '/signup' do
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
      @rider = Rider.new(:username => params[:username], :email => params[:email], :password => params[:password])
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

  get '/riders/login' do
  # binding.pry
    if logged_in?
      redirect '/autopods'
    else
      # erb :'users/new'
      erb :'riders/login'
    end


# binding.pry
  post '/riders/login' do
    # binding.pry
    @rider = Rider.find_by(username: params[:username])
    # session[:id] = @user.id
        # binding.pry
    if @rider && @rider.authenticate(params[:password])
      session[:rider_id] = @rider.id
      redirect '/autopods'
    else
      redirect "/login"
    end
  end

end




end
