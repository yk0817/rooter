require 'mechanize'
require 'logger'
require 'nokogiri'

agent = Mechanize.new
agent.user_agent_alias = "Mac Safari"
# agent.log = Logger.new $stderr

page = agent.get("https://mypage.onward.co.jp/b/pc/PWCheck.html?mthd=51")
form_login = page.forms[0]
form_login.CUSTOMER_NICKNAME = "mi-numero@hotmail.co.jp"
form_login.PASSWORD = "39884516"
login_page = agent.submit(form_login)

pp login_page
exit

my_page = Nokogiri::HTML.parse(login_page.body,nil,"shift_jis")

# login後、カートの金額と自分のポイントを表示

print "カートの金額は\n"
print my_page.css(".user_cart > .total > span")[0].text + "\n"
print "です。\n"

print "ちなみに"
print my_page.css(".point-total").text + "\n"

# サイトを移動して、購入履歴を出してみる。
# 参考ページhttp://d.hatena.ne.jp/tomoyamkung/20121020/1350721275
# https://mypage.onward.co.jp/b/pc/Purchase.html?mthd=doList

purchase = login_page.link_with(:text => "詳細を確認する").click

purchase_page = Nokogiri::HTML.parse(purchase.body,nil,"shift_jis")
print "購入履歴は"
print purchase_page.css(".history-lists.area").text
