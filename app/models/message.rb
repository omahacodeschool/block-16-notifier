class Message

  def self.cap_message(message)
    capped_message = message[0,130]
    return capped_message
  end

  def self.send_message(number)
      @text_number = number
      @twilio_number = ENV['TWILIO_NUMBER']
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      @APIInfo = Special.getFacebookInfo
      @facebook_message = Special.printInfo(@APIInfo)
      @message = @facebook_message[0,120]

      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => @text_number,
        :body => @message,
        # US phone numbers can make use of an image as well.
        # :media_url => image_url 
      )
  end


end