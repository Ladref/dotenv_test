# https://www.rubyguides.com/2016/04/twitter-api-from-ruby-tutorial/

require 'twitter'
require 'dotenv'
Dotenv.load('../.env')
require 'pry'
require 'csv'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

tweets = client.user_timeline('NBA', count: 20)

#tweets.each { |tweet| puts tweet.full_text }
#CSV.open("nba.csv", "w") do |csv|
#  csv << tweet.full_text
#end

lst = []
tweets.each do |tweet|
  lst << tweet.full_text
end

CSV.open("nba.csv", "w") do |csv|
  csv << lst
end
