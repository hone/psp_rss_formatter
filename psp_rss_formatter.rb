require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'haml'
require 'open-uri'

get '/' do
  haml :index
end

get '/feed' do
  # process XML file
  xml_doc = Nokogiri::XML.parse(open(params[:feed_url]))
  titles = xml_doc.search('item > title')
  titles.each do |title|
    title.content = title.content
  end

  xml_doc.to_xml
end
