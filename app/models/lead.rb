require 'uri'

class Lead < ActiveRecord::Base
  def self.send_data(req_info)
    new_record = Lead.new

    new_record.first_name = req_info[:name]
    new_record.last_name = req_info[:lastname]
    new_record.address = req_info[:Address]
    new_record.city = req_info[:City]
    new_record.state = req_info[:State]
    new_record.zip = req_info[:Zip]
    new_record.country = req_info[:Country]
    new_record.phone = req_info[:Phone]
    new_record.email = req_info[:email]

    res = new_record.save
    url2 = URI.escape('http://sendy.livingscriptures.com/subscribe#{req_info}')

    begin
      RestClient.post(url2)
    rescue => ex
      logger.error ex.message
      puts ex.message

      puts '============================'
      puts url2
      puts '============================'
    end
    # var url1 = 'https://api.five9.com/web2campaign/AddToList?';
    # var url2 = 'https://sendy.livingscriptures.com/subscribe';

    # https://api.five9.com/web2campaign/AddToList?&F9domain=LivingScriptures&number1=9124238974&F9list=Outbound%20Generated%20Leads&F9CallASAP=f9&first_name=1123&last_name=123&zip=12123&street=123
    send_url = 'https://api.five9.com/web2campaign/AddToList?&F9domain=LivingScriptures&number1='
    send_url += new_record.phone
    send_url += '&F9list=Outbound%20Generated%20Leads&F9CallASAP=f9'
    send_url += '&first_name=' + new_record.first_name
    send_url += '&last_name=' + new_record.last_name
    send_url += '&zip=' + new_record.zip
    send_url += '&street=' + new_record.address
    send_url += '&City=' + new_record.city
    send_url += '&Country=' + new_record.country
    send_url += '&email=' + new_record.email

    url1 = URI.escape(send_url)
    puts url1

    response = RestClient.get url1
  end
end
