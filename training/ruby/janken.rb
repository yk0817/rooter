print "じゃんけんをしましょう。\nアルファベットで自分が出したい手を入力して下さい。\ng→グー\nc→チョキ\np→パー\n"
you = gets.chomp
comp_array = ["g","c","p"]

if you
  comp = comp_array[rand(comp_array.length)]
  if you == "g" && comp == "c" || you  == "p" && comp == "g" || you == "c" && comp == "p"
    then print "あなたの勝ち"
  elsif you == comp
    then print "あいこ"
  else
    print "あなたの負け"
  end

end
