require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'haml'

get '/' do
  haml :index
end

post '/feed' do
  params[:feed_url]
end
