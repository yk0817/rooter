# naverまとめ http://matome.naver.jp/ の「注目のまとめ」の、タイトル、view数、著者、詳細リンク先を
# DBにタイトル、view数、著者、詳細リンク先の4カラムから成るテーブルを作成して、そこにスクレイピングしたデータを出力します。
# ruby naver.rb > naver.

require 'open-uri'
require 'nokogiri'
require 'active_record'
require 'pp'





url = 'http://matome.naver.jp/tech'

charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read
end

ActiveRecord::Base.logger = Logger.new(STDOUT)


ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "root",
  password: "",
  database: "training",
)

# テーブル作成してみた。
# class CreateProducts < ActiveRecord::Migration[5.0]
#   def change
#     create_table :navers do |t|
#       t.string :title
#       t.string :view_num
#       t.string :author
#       t.string :link
#     end
#   end
# end

# 作成してみた。
# create = CreateProducts.new
# create.change


doc = Nokogiri::HTML.parse(html, charset)

# puts 'タイトル数,view数,著者,詳細リンク先'

class Naver < ActiveRecord::Base
end

Naver.delete_all


  doc.search('.mdTopMTMList01Item').each do |chumoku|
    row = {}
    row[:title] = chumoku.css('div > h3 > a').text
    row[:view_num] = chumoku.css('div > div > p > span')[0].text
    row[:author] = chumoku.css('div > div > p > a').text
    row[:link] = chumoku.css('div > div > p > a').attribute('href').value

    # pp row

    Naver.create(row)
  end

pp Naver.all
