class Janken
  def computer
    comp_array = ["g","c","p"]
    comp = comp_array[rand(comp_array.length)]
  end
  def judge(you,com)
    if you == "g" && com == "c" || you  == "p" && com == "g" || you == "c" && com == "p"
      then print "あなたの勝ち"
    elsif you == com
      then print "あいこ"
    else
      print "あなたの負け"
    end
  end
end
