class Entry < ActiveRecord::Base
  require 'feedjira'
  
  has_many :favorites
  has_many :users, through: :favorites

  def self.update_from_feed(feed_url)
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
    feed.entries.each do |entry|
      create!(title: entry.title, url: entry.url)
    end
  end

end
