#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/helper'
require 'kconv'
require 'uri'
require 'twitter'

begin
  oauth = Twitter::OAuth.new(@conf['consumer_key'], @conf['consumer_secret'])
  oauth.authorize_from_access(@conf['access_token'], @conf['access_secret'])
  tw = Twitter::Base.new(oauth)
rescue => e
  STDERR.puts e
  exit 1
end

Page.all(:conditions => {:status => 'stored'}).each{|page|
  mes = "#{page.title} #{page.url}"
  tw.update(mes)
  page.status = 'published'
  page.published_at = Time.now.to_i
  page.save
  puts mes
  sleep 5
}
