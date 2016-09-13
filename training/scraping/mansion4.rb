# 目標 ./json/city_address.jsonを用いて
# 例 https://nuro.jp/mnm/rest/mnolsu/provideMansionSearch/?address_key=12102002000
# 読み込み　ファイル保存 但し、出来れば情報の選択を行いたい。 totalゼロのところは保存しないなど

require 'pp'
require 'uri'
require 'json'
require 'net/http'

search_url = "https://nuro.jp/mnm/rest/mnolsu/provideMansionSearch/"

json_data = File.open("./json/city_address.json") do |f|
  JSON.load(f)
end


hash = {}
mansion_hash = []

json_data.each do |test|
  url = URI.escape(search_url + "?address_key=#{test["address_key"]}")
  uri = URI.parse(url)
  json = Net::HTTP.get(uri)
  json_read = JSON.load(json)

  if json_read["total"].to_i >= 1
    print "1"
    hash["name"] = json_read["buildings"][0]["name"]
    print hash["name"]
    # 長いためブレーク
    # break
    mansion_hash << hash
    hash = {}
  end
  sleep 1
end

pp mansion_hash
