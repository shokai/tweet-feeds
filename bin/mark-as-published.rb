#!/usr/bin/env ruby
require File.expand_path '../bootstrap', File.dirname(__FILE__)
require 'kconv'
require 'uri'
require 'twitter'
require 'json'

Bootstrap.init :models

Page.find_to_publish.each{|page|
  page.status = Page::Status::PUBLISHED
  page.published_at = Time.now
  page.save
  puts mes = "#{page.title} #{page.url}"
}
