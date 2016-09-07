# require "rubygems"
require 'active_record'
# require 'mysql'

ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "root",
  password: "",
  database: "training",
)

# activeRecord モデル(単数)→テーブル(複数)にしているから？
# しかも命名する必要がないって何か変な気が・・・
class User < ActiveRecord::Base
end

# レコード取得
p User.all
# p ActiveRecord::Base.all

# # MySQL に接続します。
# my = Mysql.new('localhost', 'root', '', 'training')
#
# # SQL クエリを実行
# res = my.query('SELECT * from users')
#
# # 結果を表示します。
# res.each do |row|
#   puts row
# end
