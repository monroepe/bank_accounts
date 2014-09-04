require 'sinatra'
require 'sinatra/reloader'
require_relative 'account'
require_relative 'transaction'

require 'pry'





get '/' do
  erb :index
end

get '/account' do
  erb :'account/index'
end

get '/account/:name' do
  erb :'account/show'
end
