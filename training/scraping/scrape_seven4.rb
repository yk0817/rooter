require 'nokogiri'
require 'pp'
require 'uri'
require 'time'

if ARGV.length != 1
  p "キーワードがみつかりませんよー"
#   exit
end

keyword = ARGV[0]

# curl -d username=hoge -d password=fuga http:/example.com/

today = "2016/09/22"
# https://twitter.com/search?q=七つの大罪 since:2016-08-10-1659 until:2016-08-15-1900&src=typd

unix = Time.parse(today).to_i
unix2 = unix

array = ""

20.times do |t|
  unix2 = unix + 60 * 60
  url = "https://twitter.com/search?q=七つの大罪 since:#{Time.at(unix).strftime("%Y-%m-%d-%H%M")} until:#{Time.at(unix2).strftime("%Y-%m-%d-%H%M")}&src=typd"
  # pp url
  encode_url = URI.escape(url)
  tests = `curl  #{encode_url}`

  doc = Nokogiri::HTML.parse(tests,"utf-8")

  if doc.css(".fullname").text != ""
    array += doc.css(".fullname").text
    # pp array
    # exit
  end
  unix = unix2
end

print "ヘッダ情報"
# 現時点でのヘッダ情報しかダウンロード出来ていない。
print `curl -I #{encode_url}`

pp array
