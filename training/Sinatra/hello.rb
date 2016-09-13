require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb :index
end

post '/form' do
  @post_name = params[:post_name]
  erb :form
end

get '/form?:get_name?' do
  @get_name = params[:get_name]
  erb :form
end
