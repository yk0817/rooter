# 現在の日時をUTCで出力してください

puts Time.now.utc

# タイムスタンプ「1472607552」を日本時刻の「2016-08-31 10:37」のような形で出力してください
puts Time.at(1472607552).strftime('%Y-%m-%d %H:%M')

# 現在の時刻から24時間後の日時を日本の時刻で出力してください
date = Time.now + 24 * 60 * 60
p date.strftime('%Y-%m-%d %H:%M')
