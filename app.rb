require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"
require 'pry'

require_relative 'models/contact'

get '/' do
  @contacts = Contact.all
  erb :index
end

get '/contacts/:id' do
  id = params[:id]
  @contact = Contact.find(id)
  erb :show
end

get '/new' do
erb :new
end

post '/new' do
  @record = Contact.new(params[:contact])
  @record.save
  redirect '/'
end
