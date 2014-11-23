# FETCH RACEDAY WIN ODDS - only on racedays

require "net/http"


class Win
  def initialize
  @http = Net::HTTP.new("bet.hkjc.com")
  end
  def win(date='23-11-2014',venue='ST',race='8')
    @http.request(Net::HTTP::Get.new("/racing/getXML.aspx?type=jcbwracing_winplaodds&date=#{date}&venue=#{venue}&start=#{race}&end=8&data="))
  end
end

win_market = Win.new()
market = win_market.win('23-11-2014','ST','7')
puts market.code.to_s
puts market.body.to_s
puts 'done'

# => 200
# => <OUT>103238@@@@@@@@@@@@@@@@@@@@@WIN;1=5.2=0;2=6.0=0;3=28=0;4=14=0;5=27=0;6=2.8=1;7=23=0;8=38=0;9=72=0;10=13=0;11=24=0;12=61=0;13=9.0=0;14=25=0#PLA;1=2.1=0;2=2.5=0;3=6.5=0;4=4.9=0;5=6.0=0;6=1.6=1;7=4.5=0;8=9.9=0;9=12=0;10=4.0=0;11=4.1=0;12=10=0;13=2.4=0;14=4.3=0@@@WIN;1=3.2=0;2=28=0;3=4.4=0;4=2.5=1;5=11=0;6=47=0;7=15=0;8=56=0;9=33=0;10=54=0#PLA;1=1.0=1;2=5.7=0;3=1.4=0;4=2.0=0;5=2.7=0;6=6.9=0;7=2.8=0;8=7.5=0;9=5.0=0;10=8.0=0</OUT>
#
# => done
