class Blast
    def self.create
        # 1. Check database for any DailySpecial records where 'sent' is 'false'.
        # 2. If there is one, `Twilio.send_update_to_subscribers()`.
        # 3. If there is not, do nothing.
        check_for_special = DailySpecial.where("sent = 'false'")
        if check_for_special == []
            # As long as check_for_special isn't an empty array, this will send a message.
            # We still have to populate the message (probably in the send_message method)
        else 
          saved_numbers = Array.new
          Phone.each do |element|
            element.number << saved_numbers
          end
    		  saved_numbers.each do |element|
    		    sendSpecialText = Updater.send_update_to_subscribers(element)
		      end
          # This should update the DB record with the false entry, and make it true so that it won't catch that entry
          # and send another blast.
          
          daily_special_entry = DailySpecial.find_by(sent: 'false')
          daily_special_entry.update(sent: 'true')

		end
    end    	

end