#!/usr/bin/env ruby
require File.expand_path '../bootstrap', File.dirname(__FILE__)
Bootstrap.init :models
require 'kconv'
require 'uri'

client = nil
begin
  client = Twitter::REST::Client.new do |c|
    c.consumer_key = Conf['consumer_key']
    c.consumer_secret = Conf['consumer_secret']
    c.oauth_token = Conf['access_token']
    c.oauth_token_secret = Conf['access_secret']
  end
rescue => e
  STDERR.puts e
  exit 1
end

Page.find_to_publish.each{|page|
  mes = "#{page.title} #{page.url.gsub(' ', '%20')}"
  begin
    client.update mes
  rescue
    STDERR.puts "tweet failed! #{mes}"
    next
  end
  page.status = Page::Status::PUBLISHED
  page.published_at = Time.now
  page.save
  puts mes
  sleep 5
}
