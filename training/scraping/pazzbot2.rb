# http://www.pazzbot.net/ms/から、昼の飯より亀の甲のテーブルをスクレイピングしてください。
# 出力形式は[{"日付"=> 7/26, "昼0組" => 13:00, ・・・}, {"日付"=> 7/27, ・・・}]です
# なお、日付、時間のvalueは文字列ではなくTime型にしてください。
require 'open-uri'
require 'nokogiri'
require 'pp'
require 'time'
require './time_rel'

url = 'http://www.pazzbot.net/ms'

charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html,charset)

hiru_array = []
hiru_hash = {}
count = 0

doc.search('.guerrillaTable > tbody')[0].css('tr').each do |g|
  if g.css('td').text != ""
    hiru_hash["日付"] = Time.at(time_rel(g.css('th').text))
      g.css('td').each do |gg|
        hiru_hash["昼#{count}組"] = Time.parse(gg.text,hiru_hash["日付"])
        count = count + 1
      end
    hiru_array.push(hiru_hash)
    hiru_hash = {}
    count = 0
  end
end

puts hiru_array
