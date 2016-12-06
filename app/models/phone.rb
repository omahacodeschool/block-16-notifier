class Phone < ActiveRecord::Base
	validates :number, length: { is: 11 }
	validates_format_of :number, :with => /[0-9]/

	# This method formats the number correctly for use with Twilio.  
	# Twilio requires a correctly formatted number (a ten digit number with a "1" on the front of it)
	# The number will be saved without any other characters, and, if there is not a "1" on the front, 
	# the method will add a "1" to the front. 
	#
	# There is a validation at the top to make sure that, after it has been formatted, that the 
	# ActiveRecord object will have exactly 11 numbers, else it will not be saved to the database.
	def self.format_number(phone_params={})
		phone_number = phone_params[:number].split("")

		phone_number.each do |char|
			if char == " " || char == "-" || char == "(" || char == ")"
				phone_number.delete(char)
				phone_number.delete(' ')
			end
		end		
		formatted_number = phone_number.join
		
		if formatted_number[0] != "1"
			formatted_number.insert(0, "1")
		else
		end

		return formatted_number
	end

end
