class AutopodsController < ApplicationController

  #
  # get '/autopods' do
  #   # @autopod = Autopod.all
  #   erb :'autopods/index'
  # end

    get '/autopods' do
    # binding.pry
      if current_user
          # binding.pry
        @autopods = Autopod.all
        erb :"autopods/index"
      else
        redirect "/riders/login"
      end
  end


  get '/autopods/new' do
  # binding.pry
    if logged_in?
      # binding.pry
      erb :"autopods/new"
    else
      # binding.pry
      redirect to "/riders/login"
    end

  # erb :"tweets/new"
  end

  post '/autopods' do
  # binding.pry
    if !params[:pod_name].empty?
      @autopod = Autopod.new(pod_name: params[:pod_name], rider_id: session[:rider_id])
      # binding.pry
      @autopod.save
      redirect "/autopods/#{@autopod.id}"
    else
      redirect "/autopods/new"
    end
  end

  get '/autopods/:id' do
    if logged_in?
      # binding.pry
      @autopod = Autopod.find_by(id: params[:id])
      erb :"autopods/show"
    else
      redirect "/riders/login"
    end
  end




#
#   get '/tweets/:id' do
#   if logged_in?
#     @tweet = Tweet.find_by(id: params[:id])
#     erb :"tweets/show"
#   else
#     redirect "/login"
#   end
# end

  delete '/autopods/:id/delete' do #delete action
    @autopod = Autopod.find_by_id(params[:id])
    @autopod.delete
    redirect to '/autopods'
  end




end
