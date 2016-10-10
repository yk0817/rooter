require 'nokogiri'
require 'pp'
require 'uri'

if ARGV.length != 1
  p "キーワードがみつかりませんよー"
  exit
end

keyword = ARGV[0]

url = 'https://twitter.com/search?q=\'#{keyword}\'&src=typd&lang=ja'
encode_url = URI.escape(url)

tests =  `curl  #{encode_url}`

pp tests

print "ヘッダ情報"
print `curl -I #{encode_url}`

doc = Nokogiri::HTML.parse(tests,"utf-8")


if doc.css(".fullname").text != ""
  pp doc.css(".fullname").text
end
