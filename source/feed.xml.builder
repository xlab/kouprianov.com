xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Kouprianov's Notes"
  xml.subtitle "software engineer, gadget-geek, perfectionst"
  xml.id "https://kouprianov.com/notes"
  xml.link "href" => "https://kouprianov.com/notes"
  xml.link "href" => "https://kouprianov.com/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Maxim Kouprianov" }

  blog.articles[0..10].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => "https://kouprianov.com" + article.url
      xml.id "https://kouprianov.com" + article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Maxim Kouprianov" }
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end