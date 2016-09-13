# https://nuro.jp/mansion/service/neworder/ から、都道府県別の対応マンションを出力してください（ヒント：JSON）
require 'open-uri'
require 'pp'
require 'uri'
require 'json'
require 'net/http'


# json→parse と

hash = {}
city_hash = []

prefecture = %W(栃木県 群馬県 埼玉県 東京都 千葉県 神奈川県 )



prefecture.each do |pr|
  # pp pr
  url = URI.escape("https://nuro.jp/hikari/area-wrapper/wrapper/area2/city?pref=#{pr}")
  uri = URI.parse(url)
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)

  result["addresses"].each do |city|
    hash["pref"] = city["pref"]
    hash["city"] = city["city"]
    city_hash << hash
    hash = {}
  end
end

pp city_hash

File.open("./json/pref_city.json",'w') do |file|
  str = JSON.dump(city_hash,file)
end
