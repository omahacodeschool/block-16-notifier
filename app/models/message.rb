class Message

  def self.send_message(number)
  	# For the method, we might pass in the phone numbers from the DB as arguments
      @twilio_number = number
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      
      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => ENV["PHONE"],
        :body => 'Phantom Menace was clearly the best of the prequel trilogy.',
        # US phone numbers can make use of an image as well.
        # :media_url => image_url 
      )
  end


end