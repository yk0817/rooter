print "Content-type: text/html\n\n"

require 'mechanize'

agent = Mechanize.new
agent.user_agent_alias = "Mac Safari"

page = agent.get("https://www.rakuten-sec.co.jp/")

# pp page.forms[2]

form_login = page.forms[2]
form_login.loginid = "YQUP3685"
form_login.passwd = "39883988"
# agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
# agent.follow_meta_refresh = true

top_page = agent.submit(form_login)
pp top_page



# form["session[logi]"] = "jesushill"
