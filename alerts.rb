require 'httparty'
require 'bundler/setup'
require 'pry'

class Alerts

  BASE_URI = "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/"

  def get(zip_code)
    HTTParty.get("#{BASE_URI}alerts/q/#{zip_code}.json")
  end

end
