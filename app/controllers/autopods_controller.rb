class AutopodsController < ApplicationController
# require 'pry'

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
      if @autopod = Autopod.find_by(id: params[:id])
        erb :"autopods/show"
      else
        # "no such autopod!"
        redirect "/autopods"
      end
    else
      redirect "/riders/login"
    end
  end


    # binding.pry
  delete '/autopods/:id/delete' do #delete action
    # binding.pry
      @autopod = Autopod.find_by_id(params[:id])
          # binding.pry
    if logged_in? && @autopod.rider_id == current_user.id
      @autopod.delete
      redirect to '/autopods'
    else
      redirect to '/autopods'
    end
end

  get '/autopods/:id/edit' do  #load edit form
      @autopod = Autopod.find_by_id(params[:id])
      if logged_in? && @autopod.rider_id == current_user.id
            erb :'autopods/edit'
      else
        redirect to "/autopods"
      end
    end


  patch '/autopods/:id' do #edit action
      @autopod = Autopod.find_by_id(params[:id])
      if logged_in? && @autopod.rider_id == current_user.id # if it's the right user
          @autopod.pod_name = params[:pod_name]
          @autopod.save
          redirect to "/autopods"
      else
        redirect to "/autopods/#{@autopod.id}"
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






end
