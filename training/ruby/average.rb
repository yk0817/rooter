File.open("meibo.txt","r+") do |f|
  count = 0
  total = 0
  arr = Array.new()
  f.each_line do |file_line|
    file_line.chomp!
    arr.push(file_line.split("\t")[2].to_i)
    count += 1
    total += file_line.split("\t")[2].to_i
  end
  p total / count
end
