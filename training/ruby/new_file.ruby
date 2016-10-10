count = 0
10.times{

  if count % 2 == 0
    `touch #{count}.json `
  else
    `touch #{count}.txt `
  end

  count += 1
}
