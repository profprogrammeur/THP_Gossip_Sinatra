require 'gossip'
class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
    # puts Gossip.all[5].author
  end
 
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'  
  end

  get '/gossips/:id/' do
    erb :show, locals: {gossip: Gossip.find(params['id'].to_i)}
  end

  get '/gossips/:id/edit/' do
    erb :edit, locals: {gossip: Gossip.find(params['id'].to_i)}
  end

  post '/gossips/:id/edit/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
        Gossip.update(params['id'].to_i)

    redirect '/'  
  end

  # get '/gossips/:id/' do
  #   erb :show, locals: {gossip: Gossip.find(params['id'])}
  # end

end