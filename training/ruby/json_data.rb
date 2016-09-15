require 'json'
require 'pp'
# print JSON.parse('[1, 2, 3]')

 data_json1 = '{"gsacademy":"プログラミング学校","プログラム経験":"ruby"}'
 data_json2 = '["gsacademy","学生番号","プログラム経験","ruby"]'
 # data_json3 = '{"gsacademy":"プログラミング学校","学生番号":"18","プログラム経験":[{"Ruby":"1ヶ月"},{"Python":"3ヶ月"}]}'
 data_json3 = '{"gsacademy":"プログラミング学校","学生番号":"18","プログラム経験":[{"Ruby":"1ヶ月"},{"Python":"3ヶ月"}],"好きなフレームワーク":[{"Ruby":"SinatraとRailsしか知りません。。。"},{"Javascript":"riot"}]}'

 # data_json = '{"gsacademy":"プログラミング学校","学生番号":"18","プログラム経験":[{"Ruby":"1ヶ月"},{"Python":"3ヶ月"}],"好きなフレームワーク":[{"Ruby":"SinatraとRailsしか知りません。。。"}]}'
 # data_json = '[{"gsacademy":"プログラミング学校"},"プログラミング楽しいかな。"]'
 # data_ruby = JSON.parse(data_json3)
 # data_json2 = JSON.parse(data_json)
 # print data_json #
 data1,data2,data3 = JSON.load(data_json1),JSON.load(data_json2),JSON.load(data_json3)

print data1["gsacademy"].to_s + "\n"       #->プログラミング学校
print data2[3] + "\n"                      #->ruby

print data3["好きなフレームワーク"][0]["Ruby"] # -> SinatraとRailsしか知りません。。。yama:ruby

 # print data_ruby["好きなフレームワーク"] # json形式データ型なので、gsacademy jsonに代入しただけ
 # print "\n"
 # print data_ruby
 # print data_ruby["gsacademy"] #プログラミング学校
 # print data_json["gsacademy"] # ハッシュからキーに対応する値を取り出している。
 # print data_ruby["好きなフレームワーク"][0]["Ruby"]
