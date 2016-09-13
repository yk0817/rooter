require 'open-uri'
require 'pp'
require 'nokogiri'

url = 'http://www.yahoo.co.jp'



charset = nil

# ファイルとして読み込みます。

html = open(url) do |f|
  # puts f
  charset = f.charset #文字種別取得
  # p charset
  f.read
  # exit
end

p html

doc = Nokogiri::HTML.parse(html,nil,charset)

p doc.html
