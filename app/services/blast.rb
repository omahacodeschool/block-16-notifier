class Blast

    # 1. Check database for any DailySpecial records where 'sent' is 'false'.
    # 2. If there is one, the method will send a message to subscribers with the specials information.
    # 3. If there is not, the method will do nothing.
    def self.create
      check_for_special = DailySpecial.where("sent = 'false'")
      if check_for_special == []
          # As long as check_for_special isn't an empty array, this will send a message.
      else 
        saved_numbers = Array.new
        Phone.find_each do |element|
          saved_numbers << element.number
        end
  		  saved_numbers.each do |element|
  		    sendSpecialText = Updater.send_update_to_subscribers(element)
	      end
        # The below section should update the DB record with the false entry, and make it true so that it won't catch that entry
        # and send another blast.
        
        daily_special_entry = DailySpecial.find_by(sent: 'false')
        daily_special_entry.update(sent: 'true')
	    end
    end    	

end