# ruby loop.rb > test.csv

require 'date'
require 'csv'


loop do
# puts Time.now
  CSV.open('test.csv','w') do |test|
    test << ["時刻",Time.now]
    sleep 1
  end
end
