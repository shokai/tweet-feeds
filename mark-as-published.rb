#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/helper'
require 'kconv'
require 'uri'
require 'twitter'
require 'json'
$KCODE = 'u'

Page.all(:conditions => {:status => 'stored'}).each{|page|
  page.status = 'published'
  page.published_at = Time.now.to_i
  page.save
  puts mes = "#{page.title} #{page.url}"
}
