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
  # url = URI.escape(search_url + "?address_key=10202006000")
  uri = URI.parse(url)
  # pp NET::HTTP.get(uri)
  json = Net::HTTP.get(uri)

  # print json

  json_read = JSON.load(json)
  # pp json_read["total"]
  # pp json_read["buildings"][0]["name"]

  # print json["total"][0]

  # pp json["total"][1].to_i

  # exit
  # "result_code":"000","total":1,"buildings":[{"id":"0000000000977335","name":"セレストタワー高崎","zip":"3700831","address_key":"10202006000","pref":"群馬県","city":"高崎市","town":"あら町","house_number":"２０１"}]}
  # print json

  if json_read["total"].to_i >= 1
    print "1"
    hash["name"] = json_read["buildings"][0]["name"]
    mansion_hash << hash
    hash = {}
  end
end

pp mansion_hash

# File.open("./json/city_address.json",'w') do |f|
#   str = JSON.dump(mansion_hash,f)
# end
