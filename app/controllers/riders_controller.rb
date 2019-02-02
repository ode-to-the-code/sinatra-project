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
        #
          if Rider.find_by(username: params[:username], email: params[:email])
              redirect '/signup'
          else
              @rider = Rider.new(username: params[:username], email: params[:email], password: params[:password])
              @rider.save
              session[:rider_id] = @rider.id
          end
        # end
          # binding.pry
          # session[:rider_id] = @rider.id
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

  # get '/riders/logout' do
  #   "Hello World 2"
  # end


#   # get '/riders/logout' do
#   get '/logout' do
#    binding.pry
#   # if current_user?
#   if session[:rider_id]
#     session.clear
#     puts "Goodbye, Rider! You've been logged out."
#     redirect "/riders/login"
#   else
#     redirect "/riders"
#   end
# end


 # get '/riders/logout' do
 # put a small hidden form with a button that takes you to this request
 get '/riders/logout' do

  # get '/logout' do
    #  binding.pry
    # if current_user?
    # if session[:rider_id]
      session.clear
      puts "Goodbye, Rider! You've been logged out."
      redirect "/riders/login"
    # else
    #   redirect "/riders/logout"
    # end

end

  get "/riders/:id" do
    # binding.pry
    # @rider = Rider.find_by(params[:rider_id]).autopods
    erb :'riders/show'
  end
 #
 #  delete '/riders/:id/delete' do #delete action
 #    @rider = Rider.find_by_id(params[:id])
 #    @rider.delete
 #    redirect to '/welcome'
 # end

# do validation so users





end
