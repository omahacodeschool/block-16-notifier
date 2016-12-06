class Updater

    # Send the daily special to all of our subscribers.
    #
    # msg - The latest DailySpecial ActiveRecord object.
    def self.send_update_to_subscribers(number)
      text_number = number
      twilio_number = ENV['TWILIO_NUMBER']
      special = DailySpecial.where("sent = 'false'")[0]
      special_text = special.text[0...110] + "..."
      special_image = special.photo
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

      message = @client.account.messages.create(
        :from => twilio_number,
        :to => text_number,
        :body => special_text,
        :media_url => special_image 
      )
    end
end
