#!/usr/bin/env ruby
require File.expand_path '../bootstrap', File.dirname(__FILE__)
Bootstrap.init :models
require 'feed-normalizer'
require 'kconv'
require 'uri'

Conf['feeds'].each{|url|
  puts url
  begin
    feed = FeedNormalizer::FeedNormalizer.parse http_get(url)
  rescue StandardError, Timeout::Error => e
    STDERR.puts 'feed parse error!'
    STDOUT.puts e
    next
  end
  next unless feed
  feed.entries.reverse.each{|i|
    page = Page.new(
                    :url => i.url,
                    :title => i.title.to_s.toutf8,
                    :description => i.description.to_s.toutf8,
                    :date_published => i.date_published
                    )

    puts "#{i.title} - #{i.url}"
    if page.save
      puts " => saved!"
    else
      puts " => skip"
    end
  }
}

