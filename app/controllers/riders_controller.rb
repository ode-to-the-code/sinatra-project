class RidersController < Sinatra::Base

    get '/signup' do
      if session[:user_id]
        # binding.pry
        redirect "/tweets"
      else
        erb :'riders/new'
      end
  end




end
