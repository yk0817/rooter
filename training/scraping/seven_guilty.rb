# curlコマンドでtest.htmlとして保存を行った。
# curl -o test.html -Lso- https://goo.gl/Hm7Y89
# `curl https://goo.gl/Hm7Y89`
require 'nokogiri'
require 'pp'

doc = File.open("test.html") do |f|
  f.each do |ff|
    doc = Nokogiri::HTML.parse(ff,"utf-8")
      if doc.css(".fullname").text != ""
        pp doc.css(".fullname").text
      end
  end
end
