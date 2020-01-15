namespace :news do
  task feeds: [:environment] do
    Feed.all.each do |feed|
      xml = HTTParty.get(feed.url).body
      content = Feedjira.parse xml
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(content: entry.content, author: entry.author, url: entry.url, published: entry.published)
        p "Newsed Entry - #{entry.title}"
      end
      p "Newsed Feed - #{feed.name}"
    end
  end
end
