from bs4 import BeautifulSoup
import urllib2
# try:
#     import urllib.request as urllib2
# except ImportError:
#     import urllib2

File = urllib2.urlopen("http://jp.reuters.com")
Html = File.read()
File.close()

soup = BeautifulSoup(Html)

# red = soup.find_all("h3.article-heading")

for links in soup.find_all('h3.article-heading'):
    print links
