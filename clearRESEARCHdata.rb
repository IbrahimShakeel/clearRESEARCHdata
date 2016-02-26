require 'twitter'

# the twitter API requries this information. So go ahead and creat a new app at twitter
client = Twitter::REST::Client.new do |config_crap|
  config_crap.consumer_key    = "YOUR_CONSUMER_KEY"
  config_crap.consumer_secret = "YOUR_CONSUMER_SECRET"
  config_crap.access_token        = "YOUR_ACCESS_TOKEN"
  config_crap.access_token_secret = "YOUR_ACCESS_TOKEN_SECRET"
end

#make sure to change the following line. No need to write @ symbol.
client.search("from:YOUR_TWITTER_HANDLE hello", result_type: "recent").take(1).collect do |tweet|
  content = tweet.text
  _shellScript = "./nukebrowserdata.sh"
  system("sh #{_shellScript}") if content =~ /YOUR_MAGIC_WORD_HERE/i
end

# use the following line to if you want to tweet once you have been "saved"...
# of course leaving it at the end of the code is not a good idea since there is
# nothing to check if the cleaning up process actually worked or not..
# and i am too lazy to do that

  #client.update("Saved!")
