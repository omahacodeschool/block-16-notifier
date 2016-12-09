class Updater

    # Send the daily special to all of our subscribers.
    #
    # msg - The latest DailySpecial ActiveRecord object.
    def self.send_update_to_subscribers(number)
      text_number = number
      twilio_number = ENV['TWILIO_NUMBER']
      special = DailySpecial.where("sent = 'false'")[0]
      facebook_link = "https://facebook.com/" + special.postID

      # A note here: we really had to cut down on the length of the message because of 
      # the length of the facebook link!  Maybe if we had a way around it???

      # This conditional checks to see if the first character after the automatically added 
      # part of the message is a white space or not.  We don't want to add a strange part or word
      # if the first 72 characters are of a good length, nor do we want to push the text far past the
      # 140 character target!

      if special.text[72] == " "
        last part = ""
      else
        partial_text = special.text[72...special.text.length]
        partial_text_split = partial_text.split(/\W+/)
        last_part = partial_text_split[0]
      end
      special_text = special.text[0...72] + last_part + "..." + " " + facebook_link
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
