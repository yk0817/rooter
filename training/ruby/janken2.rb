require './computer.rb'
comp = ""


print "じゃんけんをしましょう。\nアルファベットで自分が出したい手を入力して下さい。\ng→グー\nc→チョキ\np→パー\n"
you = gets.chomp

if you
  janken = Janken.new
  janken.computer
  janken.judge(you,comp)
else
  print "間違えて入力しています。もう一度ゲームやってください。"
end
