=begin
 Copyright (c) 2009 Terence Lee.
    
 This file is part of psp_rss_formatter. 
  
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
    
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.
    
 You should have received a copy of the GNU General Public License
 along with this program. If not, see <http://www.gnu.org/licenses/>.
=end

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
