# 年齢順に並べ替え、タブ区切りで出力する

File.open("meibo.txt","r+") do |f|
  arr = Array.new()
  arr2 = Array.new()
  arr3 = Array.new()

  f.each_line do |file_line|
    file_line.chomp!
    # p file_line
    arr.push(file_line.split("\t"))
  end
  arr2 = arr.sort {|a,b| a[2] <=> b[2]}
  arr3.push(arr2.join("\t"))

  # arr2.each do |f2|
  #   arr3.push(f2.join("\t"))
  # end
  p arr3
end
