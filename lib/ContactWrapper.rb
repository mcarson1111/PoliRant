require 'httparty'

class ContactWrapper
  BASE_URL = "curl "https://www.googleapis.com/civicinfo/v2/representatives?"
"
  attr_reader :id, :food_id, :music_id, :music_type

  def initialize(data)
      @id = data["suggestion"]["id"]
      @food_id = data["suggestion"]["food_id"]
      @music_id = data["suggestion"]["music_id"]
      @music_type = data["suggestion"]["music_type"]

  end


  def self.find(item)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{item}&limit=1/").parsed_response
    data["suggestion"] = data.delete("suggestions")
    data["suggestion"] = data["suggestion"][0]

    if data["suggestion"].nil?
     return @message = "Sorry, no pairing suggestion. Try again."
   end

    self.new(data)
  end
