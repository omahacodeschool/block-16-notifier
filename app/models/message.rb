class Message < ActiveRecord::Base

	def self.send_specials(contact)
		@client = Twilio::REST::Client.new ENV["SID"], ENV["AUTH_TOKEN"]
		# TODO here
	end


end