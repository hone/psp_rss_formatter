require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'haml'
require 'open-uri'

get '/' do
  haml :index
end

get '/feed' do
end
