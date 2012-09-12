
class Page
  class Status
    STORED = 0
    PUBLISHED = 1
  end

  include Mongoid::Document
  field :url
  field :title
  field :description
  field :date_published, :type => Time, :default => nil
  field :created_at, :type => Time, :default => lambda{Time.now}
  field :published_at, :type => Time
  field :status, :type => Integer, :default => Page::Status::STORED

  validates_uniqueness_of :url
  validates_format_of :url, :with => /^https?:\/\/.+$/

  def self.find_to_publish
    self.where(:status => Page::Status::STORED)
  end
end

