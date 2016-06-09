require 'httparty'
require 'json'

class ContactWrapper
  attr_reader :officials

  BASE_URL = "https://www.googleapis.com/civicinfo/v2/representatives"


  def initialize(data)
      @officials = data["officials"]


  end


  def self.send_request(address_string)
    #if you're giving it a body, it has to be a post
    #need to put .env key in post AND I think the api takes the address as a string? %20?
    #use the ‘curl’ tool or your browser to see what kind of data this request gets.

    data = HTTParty.get(BASE_URL, query: {key: ENV['MY_KEY'], address: address_string})

      self.new(data)

  end
end
