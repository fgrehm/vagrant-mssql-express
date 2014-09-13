require 'sinatra'
require "sinatra/activerecord"

set :database_file, "./database.yml"

class Comment < ActiveRecord::Base
end

get '/' do
  @comments = Comment.all
  erb :index
end

post '/' do
  Comment.create!(
    name:    params[:name],
    message: params[:message]
  )
  redirect '/'
end
