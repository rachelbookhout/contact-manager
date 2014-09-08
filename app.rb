require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"
require 'pry'

require_relative 'models/contact'


get '/' do
if params[:query]
  @contacts = Contact.where(first_name: params[:query]) || Contact.where(last_name: params[:query])
else
  @contacts = Contact.all
 end
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
