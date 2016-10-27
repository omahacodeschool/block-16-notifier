class Message < ActiveRecord::Base

	def self.send_specials(contact)
		@client = Twilio::REST::Client.new ENV["SID"], ENV["AUTH_TOKEN"]
		
		@client.account.messages.create({
			:messaging_service_sid => ENV["SERVICE_SID"],
			:to => ENV["PHONE"],
  			:body => 'Phantom Menace was clearly the best of the prequel trilogy.'
			})
	end

      @twilio_number = ENV['TWILIO_NUMBER']
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

  def self.send_specials(client, phone_number, alert_message, image_url)
      message = client.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV["PHONE"], 
      # The above ENV needs to be replaced with real phone numbers
      body: 'Phantom Menace was clearly the best of the prequel trilogy.'
      )
  end
end