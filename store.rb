#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/helper'
require 'feed-normalizer'
require 'open-uri'
require 'kconv'
require 'uri'


@conf['feeds'].each{|url|
  puts url
  begin
    feed = FeedNormalizer::FeedNormalizer.parse open(url, 'User-Agent' => @conf['user_agent'])
  rescue => e
    STDERR.puts 'feed parse error!'
    STDOUT.puts e
    next
  rescue Timeout::Error => e
    STDERR.puts 'feed parse error!'
    STDOUT.puts e
    next
  end
  next unless feed
  feed.entries.reverse.each{|i|
    next if Page.all(:conditions => {:url => i.url}).size > 0
    page = Page.new(
                    :url => i.url,
                    :title => i.title.to_s.toutf8,
                    :description => i.description.to_s.toutf8,
                    :date_published => i.date_published
                    )
    page.save
    puts "#{i.title} => #{i.url}"
  }
}

