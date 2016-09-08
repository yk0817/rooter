# ruby scrape_list_q.rb > scrape.csv

require 'nokogiri'

html =<<EOF
<html>
<div class="row">
<div class="title">タイトル１</div>
<div class="description">解説１</div>
</div>
<div class="row">
<div class="title">タイトル２</div>
<div class="description">解説２</div>
</div>
<div class="row">
<div class="title">タイト",ル３</div>
<div class="description">解説３</div>
</div>
</html>
EOF

doc = Nokogiri.parse(html)

#以下にコードを書き足して、title,descriptionのカラムのCSVとして書き出してください

# やりたいことは こんな感じ？
#              title,description
#              タイトル,解説1　
#              タイトル2,解説2　
#              タイトル3,解説3
#
# searchはCSSセレクタ、X-PATHの検索を行う。


puts "title,description"

doc.search('.row').each do |row|
  puts row.css(".title").text + "," + row.css(".description").text
end
