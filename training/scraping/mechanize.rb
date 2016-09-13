print "Content-type: text/html\n\n"

require 'mechanize'

agent = Mechanize.new

agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
agent.follow_meta_refresh = true
# 10.
# agent.user_agent = 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko'
# 11.

# 12.
page = agent.get("https://twitter.com/")
# 13.

# 14.
form = page.forms[1]
# 15.
form["session[username_or_email]"] = "jesushill"
# 16.
form["session[password]"] = "39884516"
# 17.
page = form.submit
# 18.

# 19.
page = agent.get("https://twitter.com/")

print page.body
