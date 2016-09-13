# 目標
# mansion2から出力したjsonファイル(pref、cityをキーにADDRESS-CODE取得)
# 備忘録　使うライブラリ頭の整理

require 'pp'
require 'uri'
require 'json'
require 'net/http'

search_url = "https://nuro.jp/hikari/area-wrapper/wrapper/area2/town?"

json_data = File.open("./json/pref_city.json") do |f|
  JSON.load(f)
end

hash = {}
key_hash = []

json_data.each do |place|
  url = URI.escape(search_url + "pref=#{place["pref"]}" + "&city=#{place["city"]}")
  uri = URI.parse(url)
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)

  result["addresses"].each do |key|
    hash["zip"] = key["zip"]
    hash["city"] = key["city"]
    hash["town"] = key["town"]
    hash["address_key"] = key["address_key"]
    key_hash << hash
    hash = {}
  end
end


File.open("./json/city_address.json",'w') do |f|
  str = JSON.dump(key_hash,f)
end

# pp result
