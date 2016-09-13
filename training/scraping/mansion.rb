# https://nuro.jp/mansion/service/neworder/ から、都道府県別の対応マンションを出力してください（ヒント：JSON）

puts
# 第一目標はpref = 東京都、千葉県、埼玉県、群馬県、栃木県、茨木県、神奈川県
require 'open-uri'
require 'pp'
require 'uri'
require 'json'
require 'net/http'


# json→parse と

hash = {}
city_hash = []

# prefecture = %W(東京都 千葉県 神奈川県)
#
# prefecture.each do |p|
#   pp p
# end


url = URI.escape("https://nuro.jp/hikari/area-wrapper/wrapper/area2/city?pref=東京都")
uri = URI.parse(url)
json = Net::HTTP.get(uri)
result = JSON.parse(json)



result["addresses"].each do |city|
  hash["pref"] = city["pref"]
  hash["city"] = city["city"]
  city_hash << hash
  hash = {}
end

pp city_hash

File.open("pref_city.json",'w') do |file|
  str = JSON.dump(city_hash,file)
end
