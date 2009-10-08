require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'haml'

get '/' do
  haml :index
end

post '/feed/:feed_url' do
  params[:feed_url]
end
