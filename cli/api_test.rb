require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "insert key"
  config.consumer_secret     = "insert key"
  config.access_token        = "insert key"
  config.access_token_secret = "insert key"
end
#
client.search("coffee", :geocode => "37.7833,122.4167, 300mi").take(10).collect do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
##
#client.sample do |object|
#  puts object.text if object.is_a?(Twitter::Tweet)
#end
=begin
client.user do |object|
  case object
  when Twitter::Tweet
    puts "It's a tweet!"
  when Twitter::DirectMessage
    puts "It's a direct message!"
  when Twitter::Streaming::StallWarning
    warn "Falling behind!"
  end
end

=end
