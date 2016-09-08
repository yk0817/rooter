require 'open-uri'

require 'nokogiri'

url = 'http://www.yahoo.co.jp'

charset = nil
html = open(url) do |f|
  # puts f
  charset = f.charset #文字種別取得
  # p charset
  f.read
  # exit
end

doc = Nokogiri::HTML.parse(html,nil,charset)

p doc.title
