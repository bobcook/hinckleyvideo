require 'uri'

class Lead < ActiveRecord::Base
  def self.send_data(req_info)
    new_record = Lead.new

    new_record.first_name = URI.escape(req_info[:name])
    new_record.last_name = URI.escape(req_info[:lastname])
    new_record.address = URI.escape(req_info[:Address])
    new_record.city = URI.escape(req_info[:City])
    new_record.state = URI.escape(req_info[:State])
    new_record.zip = URI.escape(req_info[:Zip])
    new_record.country = URI.escape(req_info[:Country])
    new_record.phone = URI.escape(req_info[:Phone])
    new_record.email = URI.escape(req_info[:email])

    res = new_record.save

    begin
      RestClient.post('http://sendy.livingscriptures.com/subscribe', req_info)
    rescue => ex
      logger.error ex.message
      puts ex.message

      puts '============================'
    end
    # var url1 = 'https://api.five9.com/web2campaign/AddToList?';
    # var url2 = 'https://sendy.livingscriptures.com/subscribe';

    # https://api.five9.com/web2campaign/AddToList?&F9domain=LivingScriptures&number1=9124238974&F9list=Outbound%20Generated%20Leads&F9CallASAP=f9&first_name=1123&last_name=123&zip=12123&street=123
    send_url = 'http://api.five9.com/web2campaign/AddToList?&F9domain=LivingScriptures&number1='
    send_url += new_record.phone
    send_url += '&F9list=Outbound%20Generated%20Leads&F9CallASAP=f9'
    send_url += '&first_name=' + new_record.first_name
    send_url += '&last_name=' + new_record.last_name
    send_url += '&street=' + new_record.address
    send_url += '&city=' + new_record.city
    send_url += '&state=' + new_record.state
    send_url += '&zip=' + new_record.zip
    send_url += '&Country=' + new_record.country
    send_url += '&Email=' + new_record.email

    puts send_url

    response = RestClient.get send_url
  end
end
