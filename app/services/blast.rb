class Blast
    def self.create
        # 1. Check database for any DailySpecial records where 'sent' is 'false'.
        # 2. If there is one, `Twilio.send_update_to_subscribers()`.
        # 3. If there is not, do nothing.
        @check_for_special = DailySpecial.check_for_false
        if @check_for_special == []
        else 

          @saved_numbers = Array.new
		  @saved_numbers = [ENV["TEST_PHONE_1"], ENV["TEST_PHONE_2"]]
		  # TODO = there needs to be an array or collection of all saved phone numbers,
		  # which will be retrieved from the DB once that has been set up.
		  @saved_numbers.each do |element|
		    sendSpecialText = Message.send_message(element)
		  end
		end
    end    	

end