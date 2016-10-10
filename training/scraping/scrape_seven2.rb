require 'nokogiri'
require 'pp'
require 'uri'

keyword = "七つの大罪"

url = 'https://twitter.com/search?q=\'#{keyword}\'&src=typd&lang=ja'
encode_url = URI.escape(url)

tests =  `curl  #{encode_url}`

doc = Nokogiri::HTML.parse(tests,"utf-8")


if doc.css(".fullname").text != ""
  pp doc.css(".fullname").text
end
