xml.instruct!
xml.rss version: "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title "Space, hacks and retardation"
    xml.description "Article feed of Space, hacks and retardation"
    xml.link "#{request.scheme}://#{request.host}"
    xml.pubDate CGI.rfc1123_date(@archive.first.published_at.to_time)
    archive.each do |article|
      xml.item do
        xml.title   article.title
        xml.link    "#{request.scheme}://#{request.host}#{article.url}"
        xml.pubDate CGI.rfc1123_date(article.published_at.to_time)
        xml.description do
          xml.cdata! article.contents.html
        end
        xml.guid    "#{request.scheme}://#{request.host}#{article.url}"
        xml.author  "peter@omnidimensional.net (Peter de Ruijter)"
      end
    end
  end
end
