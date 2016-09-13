require 'time'

print "予約日を入力して下さい\n例)2016年10月22日\n"
enter_time = ((gets.chomp).split(/[年,月,日]/)).join("-")


if enter_time
  if Time.parse(enter_time).to_i >= Time.now.to_i
    print Time.parse(enter_time).to_i
  else
    print "今日の日付より過去です\nもう一度入力して下さい。\n"
  end
  print "UNIX-TIMESTAMP→DATE-TIMEへ↓\n"
  print Time.at(Time.parse(enter_time).to_i)
end
