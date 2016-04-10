class Entry < ActiveRecord::Base
  require 'feedjira'
  
  has_many :favorites
  has_many :users, through: :favorites

  validates :title, uniqueness: true

  def self.update_from_feed
    feed = Feedjira::Feed.fetch_and_parse("http://rss.cnn.com/rss/cnn_topstories.rss")
    feed.entries.each do |entry|
      unless exists? title: entry.title
        create!(title: entry.title, url: entry.url)
      end
    end
  end

end
