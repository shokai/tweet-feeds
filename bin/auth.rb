#!/usr/bin/env ruby
require File.expand_path '../bootstrap', File.dirname(__FILE__)

consumer = OAuth::Consumer.new(Conf['consumer_key'], Conf['consumer_secret'],
                               :site => "http://api.twitter.com")

request_token = consumer.get_request_token(
                                           #:oauth_callback => "http://example.com"
                                           )

puts 'please access following URL and approve'
puts request_token.authorize_url

print 'then, input OAuth Verifier: '
oauth_verifier = gets.chomp.strip

access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier)

puts '-'*5
puts 'access_token : ' + "'#{access_token.token}'"
puts 'access_secret : ' + "'#{access_token.secret}'"
puts '-'*5
