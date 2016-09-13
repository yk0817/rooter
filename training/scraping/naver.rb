# naverまとめ http://matome.naver.jp/ の「注目のまとめ」の、タイトル、view数、著者、詳細リンク先をcsvに吐き出してください。
# ruby naver.rb > naver.csv


require 'open-uri'
require 'nokogiri'
require 'csv'


url = 'http://matome.naver.jp/tech'

charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end


doc = Nokogiri::HTML.parse(html, charset)


# puts 'タイトル数,view数,著者,詳細リンク先'
print CSV.generate(:force_quotes => true){|csv|
	csv << ["タイトル", "view数", "著者", "詳細リンク先"]
}



# doc.xpath('//li[@class="mdTopMTMList01Item"]').each do |node|
 doc.search('.mdTopMTMList01Item').each do |chumoku|
  print CSV.generate(:force_quotes => true) { |csv|
    csv << [chumoku.css('div > h3 > a').text,chumoku.css('div > div > p > span')[0].text,
          chumoku.css('div > div > p > a').text,chumoku.css('div > div > p > a').attribute('href').value]

  }

doc.css(".mdTopMTMList01Item").each{|row|
  # 絞って表示
  #  p row.css(".mdTopMTMList01Item").text
}
  # puts '\'' + chumoku.css('div > h3 > a').text  +
  #     '\',\'' + chumoku.css('div > div > p > span')[0].text +
  #     '\',\'' + chumoku.css('div > div > p > a').text +
  #     ',\'' + chumoku.css('div > div > p > a').attribute('href').value + '\''

  # tilte
  # puts chumoku.css('div > h3 > a').text

  # View数
  # puts chumoku.css('div > div > p > span')[0].text

  # 著者
  # puts chumoku.css('div > div > p > a').text

  # 詳細リンク先
  # puts chumoku.css('div > div > p > a').attribute('href').value

end
