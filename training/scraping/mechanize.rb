require 'mechanize'

agent = Mechanize.new
aget.follow_meta_refresh = true
agent.redirect_ok = true
agent.user_agent_alias = 'Mac Safari'
url = "https://www.amazon.co.jp/"

p page.links
