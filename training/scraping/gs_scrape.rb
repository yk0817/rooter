require 'open-uri'
require 'nokogiri'
require 'pp'

url = 'http://jp.reuters.com'

charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read #htmlを読み込んで変数htmlに渡す
end

doc = Nokogiri::HTML.parse(html, charset)

# \n→配列化スクレイピングは？
doc.css("#hp-wire article.article").each{ |row|
  p row.css("h3.article-heading").text.strip
}


# doc.css("~").each{ |row|
#   cols = row.css("td").map{|td|
#   td.text.strip
#   }
#     puts cols.join("\t")
# }

# %記法
# urls = %w {
  # a
  # b
# }

# urls.each { |url|
#   p url
#   }

# doc.search('.inner').each do |g|
#   # p g.css('div.inner > .item > a').attribute('href').value
#   pp g.css('article > a > figure > img').attributes
# end
