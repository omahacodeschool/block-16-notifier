class Message

  def self.send_message(number)
      @text_number = number
      @twilio_number = ENV['TWILIO_NUMBER']
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      
      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => @text_number,
        :body => 'Hey it is Mike testing a program. Can you txt my personal cell if you get this message?',
        # US phone numbers can make use of an image as well.
        # :media_url => image_url 
      )
  end


end