print "Content-type: text/html\n\n"

require 'mechanize'

agent = Mechanize.new
agent.user_agent_alias = "Mac Safari"

page = agent.get("https://login.yahoo.co.jp/config/login?.src=www&.done=http://www.yahoo.co.jp")

# pp page.forms[2]

form_login = page.forms[0]
# pp form_login
form_login.login = "kenyama00881177@yahoo.co.jp"
form_login.passwd = "39884516"
# agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
# agent.follow_meta_refresh = true

top_page = agent.submit(form_login)
pp top_page



# form["session[logi]"] = "jesushill"
