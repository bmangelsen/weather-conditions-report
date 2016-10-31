require 'httparty'
require 'bundler/setup'
require 'pry'

class Conditions

  BASE_URI = "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/"

  def get(zip_code)
    HTTParty.get("#{BASE_URI}conditions/q/#{zip_code}.json")
  end

end
