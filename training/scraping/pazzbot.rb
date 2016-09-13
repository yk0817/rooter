# http://www.pazzbot.net/ms/から、昼の飯より亀の甲のテーブルをスクレイピングしてください。
# 出力形式は[{"日付"=> 7/26, "昼0組" => 13:00, ・・・}, {"日付"=> 7/27, ・・・}]です
# なお、日付、時間のvalueは文字列ではなくTime型にしてください。
require 'open-uri'
require 'nokogiri'
require 'pp'
require 'time'

url = 'http://www.pazzbot.net/ms'

charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html,charset)

hiru_array = []
hiru_hash = {}


doc.search('.guerrillaTable > tbody').each do |g|
  g.css('tr').each do |g|
    if (g.text.strip!.split("\n").length == 5 && g.text.strip!.match(/.+:.+/) )
      # tdで句切られているからtdで回していく
      test_array = g.text.strip!.split("\n")
      # pp test_array
      # Time.parse で
      hiru_hash["日付"] = Time.parse(test_array[0])
      # hiru_hash["日付"] = Time.parse("01/01")
      hiru_hash["昼0組"] = Time.parse(test_array[1],hiru_hash["日付"])
      hiru_hash["昼1組"] = Time.parse(test_array[2],hiru_hash["日付"])
      hiru_hash["昼2組"] = Time.parse(test_array[3],hiru_hash["日付"])
      hiru_hash["昼3組"] = Time.parse(test_array[4],hiru_hash["日付"])
      hiru_array.push(hiru_hash)
      hiru_hash = {}
      test_array = []
      pp hiru_array
    end
  end
pp hiru_array
end

# これからやること
# pp hiru_array
# インデントを行う
# カラムの個数
# thで見る方法
# thの個数を見る
# 日付のロジックで1月1日
