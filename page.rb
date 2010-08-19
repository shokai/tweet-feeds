require 'rubygems'
class Page
  include Mongoid::Document
  field :url
  field :title
  field :description
  field :date_published, :default => nil
  field :created_at, :type => Integer, :default => Time.now.to_i
  field :published_at, :type => Integer
  field :status, :default => 'stored'
end

