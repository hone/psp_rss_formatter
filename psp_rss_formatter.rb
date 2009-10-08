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
  feed = nil
  begin
    feed = open(params[:feed_url])
  rescue Errno::ENOENT, SocketError, URI::InvalidURIError
    return 'That is an invalid url.'
  end

  xml_doc = Nokogiri::XML.parse(feed)
  titles = xml_doc.search('item > title')
  titles.each do |title|
    title.content = title.content
  end

  xml_doc.to_xml
end
