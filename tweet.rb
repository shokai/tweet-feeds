#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/helper'
require 'kconv'
require 'uri'
require 'twitter'


begin
  Twitter.configure do |config|
    config.consumer_key = @conf['consumer_key']
    config.consumer_secret = @conf['consumer_secret']
    config.oauth_token = @conf['access_token']
    config.oauth_token_secret = @conf['access_secret']
  end
rescue => e
  STDERR.puts e
  exit 1
end

Page.all(:conditions => {:status => 'stored'}).each{|page|
  mes = "#{page.title} #{page.url}"
  begin
    Twitter.update(mes)
  rescue
    STDERR.puts "tweet failed! #{mes}"
    next
  end
  page.status = 'published'
  page.published_at = Time.now.to_i
  page.save
  puts mes
  sleep 5
}
