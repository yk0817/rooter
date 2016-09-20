# ruby loop.rb > test.csv
# nohup ruby loop.rb > test.csv &

require 'date'
require 'csv'

test_time = []

loop do
# puts Time.now
  CSV.open('test2.csv','w') do |test|
    # test_time += ["時刻",Time.now]
    # test << test_time
    test << ["時刻",Time.now]
    sleep 1
  end
end
