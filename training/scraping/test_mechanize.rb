require "mechanize"
require "pp"
require "logger"

agent = Mechanize.new
# agent.log = Logger.new $stderr
agent.max_history = 2
agent.user_agent_alias = "Mac Safari"

page = agent.get("https://store.united-arrows.co.jp/_member/login.html?pl_on=42")

#ログイン
form = page.forms[0]
form.memid7 = "ks.elda.10000@gamil.com"
form.mempw7 = "1qaz0okm"
form.checkbox_with(:name =>"autologin").uncheck
top_page = agent.submit(form)

#マイページ移動
my_page = top_page.link_with(:href =>'/_member/default.html?c=info&pl_on=42').click
#ポイント取得
my_point_page = my_page.link_with(:href =>'/_member/point/default.html').click
point_doc = Nokogiri::HTML.parse(my_point_page.body, nil, "shift_jis")
my_point = point_doc.css("#rightmain > ul").text.gsub(/[ \n\r]/, '')
pp my_point
#バーコード番号取得
my_num_page = my_page.link_with(:href =>'/_member/barcode/default.html').click
num_doc = Nokogiri::HTML.parse(my_num_page.body, nil, "shift_jis")
my_num = num_doc.css("#rightmain > div.barcode_area > div.card_number").text
pp my_num
