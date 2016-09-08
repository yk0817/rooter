require 'active_record'
# require 'mysql'

ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "root",
  password: "",
  database: "training",
)

# activeRecord モデル作成にしているから？
class User < ActiveRecord::Base
end

# SQL解析をしてくれる！！！
ActiveRecord::Base.logger = Logger.new(STDOUT)


# 全消去
User.delete_all

# 複数でデータを渡す方法を後で確認しておく。普通はハッシュ→eachか
 # "meibo.txt データ投入"
# User.create(:name => "john",:age => "18",:gender => "M")
# User.create(:name => "paul",:age => "20",:gender => "M")
# User.create(:name => "alice",:age => "15",:gender => "F")
# User.create(:name => "dabid",:age => "17",:gender => "M")
# User.create(:name => "jasmin",:age => "17",:gender => "F")



File.open("meibo.txt","r+") do |f|

  f.each_line do |file_line|
    file_line.chomp!
    name,gender,age = file_line.split("\t")

    p name,gender,age

    # User.create(:name => file_name,:gender => file_gender,:age => file_age)
    User.create(:name => name,:gender => gender,:age => age)
    p User.all
  end
end


# print "年齢順にセレクト"
#
# p User.all.order("age")
#
# print "女性のみ\n"
# # 女性のみ
# p User.all.where("gender" => "F")
#
# # 男性のみ年齢順
#
# print "男性のみ年齢順\n"
#
# p User.all.where("gender" => "M").order("age")

# レコード取得
p User.all




# # 参考 MySQLから直接データ取得してみる
# my = Mysql.new('localhost', 'root', '', 'training')
#
# # SQL クエリを実行
# res = my.query('SELECT * from users')
#
# # 結果を表示します。
# res.each do |row|
#   puts row
# end
