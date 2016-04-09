require 'active_record'

namespace :rss do
  desc "Update feed entries from CNN"
  task update_feed: :environment do
    @entries = Entry.all
    @entries.update_from_feed
  end
end
