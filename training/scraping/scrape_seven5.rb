require 'pp'
require 'json'


# jq . json.json | less

  time1 = 779269215945535488
  time2 = 780256681926074368

  array = []

5.times do |t|
  command = `curl 'https://twitter.com/i/search/timeline?vertical=default&q=%E4%B8%83%E3%81%A4%E3%81%AE%E5%A4%A7%E7%BD%AA&src=typd&include_available_features=1&include_entities=1&lang=ja&max_position=TWEET-#{time1}-#{time2}-BD1UO2FFu9QAAAAAAAAETAAAAAcAAAASAAAAAQAEAAAAAAAAAAAQAAAAAAAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAIEAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAACAAAAAAAAAAAEAAAAAAIAAAAAAAAAQQAAQACAAAAAAAAAAQCAAEAAAAAAAAAAAABBAAAAAAAAAAAAAAA&reset_error_state=false' -H 'accept-encoding: gzip, deflate, sdch, br' -H 'x-requested-with: XMLHttpRequest' -H 'accept-language: ja,en-US;q=0.8,en;q=0.6,es;q=0.4' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36' -H 'accept: application/json, text/javascript, */*; q=0.01' -H 'referer: https://twitter.com/search?q=%E4%B8%83%E3%81%A4%E3%81%AE%E5%A4%A7%E7%BD%AA&src=typd&lang=ja' -H 'authority: twitter.com' -H 'cookie: guest_id=v1%3A146561732425020486; eu_cn=1; twitter_ads_id=v1_8808552378430720; netpu="FrCCnZ28VQA="; webn=43862026; lang=ja; kdt=kLHnIk1eihTFY4hJAFBjbc5Z5pnoo8xhqYc8NVJV; remember_checked_on=0; twid="u=43862026"; auth_token=bad386d3cdea7b758e9ca38bb0f8b43f392315ed; BA=ba=1125153&be=481571.26&l=203&le=42.88&ip=118.109.124.138&t=1474259565; __utma=43838368.729689637.1465725494.1471123205.1474371620.4; __utmc=43838368; __utmz=43838368.1471123205.3.3.utmcsr=iosdc.jp|utmccn=(referral)|utmcmd=referral|utmcct=/2016/c/cfp; pid="v3:1474519413265568339352228"; external_referer="OTZIBTkFw3vpQwN6Ves5xdujQzAHf34WE9xm913/kErUfoJwU7Yw10Yx8M/EUyme|0"; _gat=1; _ga=GA1.2.729689637.1465725494; _twitter_sess=BAh7EiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo%250ASGFzaHsABjoKQHVzZWR7ADoPY3JlYXRlZF9hdGwrCNuYmT1VAToMY3NyZl9p%250AZCIlMjI2Y2UxZGY0YjI0Yjk1NTY2N2QzODJjZGFjMGQ0MWU6B2lkIiU0NzBm%250AMGNiNTk2NDVhNjlkM2Q0Y2NlODliNDU0MDY2ZDoJdXNlcmkECkidAjoSZ2V0%250AX3RpbWVzdGFtcGwrCGkwr0lWAToQZ3Vlc3RfdG9rZW4iGDY0NjA0OTg3NDcy%250AMDQ3OTc5ODY6Gmd1ZXN0X3Rva2VuX3RpbWVzdGFtcGwrCHQwr0lWASIJcHJy%250AcCIAOghwcnNpDDoIcHJ1aQSZBWcFOghwcmwiJVJEZHpGamY2Qm9KUVl2ZGhH%250AcVVIdlBzT3NZSWZMbUNJOghwcmFpBg%253D%253D--f4de11294e08a97ac6d0971d42ef49976d8355b9' --compressed `
  # original = `curl 'https://twitter.com/i/search/timeline?vertical=default&q=%E4%B8%83%E3%81%A4%E3%81%AE%E5%A4%A7%E7%BD%AA&src=typd&include_available_features=1&include_entities=1&lang=ja&max_position=TWEET-779269215945535488-780256681926074368-BD1UO2FFu9QAAAAAAAAETAAAAAcAAAASAAAAAQAEAAAAAAAAAAAQAAAAAAAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAIEAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAACAAAAAAAAAAAEAAAAAAIAAAAAAAAAQQAAQACAAAAAAAAAAQCAAEAAAAAAAAAAAABBAAAAAAAAAAAAAAA&reset_error_state=false' -H 'accept-encoding: gzip, deflate, sdch, br' -H 'x-requested-with: XMLHttpRequest' -H 'accept-language: ja,en-US;q=0.8,en;q=0.6,es;q=0.4' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36' -H 'accept: application/json, text/javascript, */*; q=0.01' -H 'referer: https://twitter.com/search?q=%E4%B8%83%E3%81%A4%E3%81%AE%E5%A4%A7%E7%BD%AA&src=typd&lang=ja' -H 'authority: twitter.com' -H 'cookie: guest_id=v1%3A146561732425020486; eu_cn=1; twitter_ads_id=v1_8808552378430720; netpu="FrCCnZ28VQA="; webn=43862026; lang=ja; kdt=kLHnIk1eihTFY4hJAFBjbc5Z5pnoo8xhqYc8NVJV; remember_checked_on=0; twid="u=43862026"; auth_token=bad386d3cdea7b758e9ca38bb0f8b43f392315ed; BA=ba=1125153&be=481571.26&l=203&le=42.88&ip=118.109.124.138&t=1474259565; __utma=43838368.729689637.1465725494.1471123205.1474371620.4; __utmc=43838368; __utmz=43838368.1471123205.3.3.utmcsr=iosdc.jp|utmccn=(referral)|utmcmd=referral|utmcct=/2016/c/cfp; pid="v3:1474519413265568339352228"; external_referer="OTZIBTkFw3vpQwN6Ves5xdujQzAHf34WE9xm913/kErUfoJwU7Yw10Yx8M/EUyme|0"; _gat=1; _ga=GA1.2.729689637.1465725494; _twitter_sess=BAh7EiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo%250ASGFzaHsABjoKQHVzZWR7ADoPY3JlYXRlZF9hdGwrCNuYmT1VAToMY3NyZl9p%250AZCIlMjI2Y2UxZGY0YjI0Yjk1NTY2N2QzODJjZGFjMGQ0MWU6B2lkIiU0NzBm%250AMGNiNTk2NDVhNjlkM2Q0Y2NlODliNDU0MDY2ZDoJdXNlcmkECkidAjoSZ2V0%250AX3RpbWVzdGFtcGwrCGkwr0lWAToQZ3Vlc3RfdG9rZW4iGDY0NjA0OTg3NDcy%250AMDQ3OTc5ODY6Gmd1ZXN0X3Rva2VuX3RpbWVzdGFtcGwrCHQwr0lWASIJcHJy%250AcCIAOghwcnNpDDoIcHJ1aQSZBWcFOghwcmwiJVJEZHpGamY2Qm9KUVl2ZGhH%250AcVVIdlBzT3NZSWZMbUNJOghwcmFpBg%253D%253D--f4de11294e08a97ac6d0971d42ef49976d8355b9' --compressed `
  json_tweet= JSON.parse(command)
  json_extract = json_tweet["inner"]["items_html"].to_s

  keywords = json_extract.scan(/<strong class=\"fullname js-action-profile-name show-popup-with-id\" data-aria-label-part>.+<.+/)
  # pp keywords

  keywords.each do |keyword|
    name = keyword.gsub!(/<strong class=\"fullname js-action-profile-name show-popup-with-id\" data-aria-label-part>/,"").gsub!(/<.+/,"")
    array.push(name)
  end
  time2 = time1
  time1 -= 1000
  sleep 2
end

pp array

# original　の数
  # "TVアニメ『sin 七つの大罪』公式"
  # "HMVアニメ！"
  # "アニメイトタイムズ公式"
  # "9-Bit"
  # "声優さん大好き♡@でも、たっつんが一番！"
  # "彩城ゆりな（ゆりにゃん）"
  # "TVアニメ「七つの大罪」"
  # "30秒アニソン動画bot"
  # "thの発音を、おざなりにしない雪那"
  # "アニメハック"
  # "大輔"
  # "びじゅなび"
  # "激ロック"
  # "ANiME SEiYU アニメセイユウ"
