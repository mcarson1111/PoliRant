require 'httparty'
require 'json'

class ContactWrapper
  attr_reader :officials, :name, :emails

  BASE_URL = "https://www.googleapis.com/civicinfo/v2/representatives?"


  def initialize(data)
      @officials = data["officials"]
      @official_name = data["officials"]["name"]
      @official_email = data["officials"]["emails"]

  end


  def self.send_request(address_info)
    #if you're giving it a body, it has to be a post
    #need to put .env key in post AND I think the api takes the address as a string? %20?
    data = HTTParty.post(BASE_URL, body: rate_info)

      self.new(rates)

  end
end
