class Phone < ActiveRecord::Base

	def self.format_number(phone)
		phone_number = phone.split("")

		phone_number.each do |char|
			if char == " " || char == "-" || char == "(" || char == ")"
				phone_number.delete(char)
				phone_number.delete(' ')
			end
		end		
		formatted_number = phone_number.join
		if formatted_number[0] != 1
			formatted_number.insert(0, "1")
		else
		end

		return formatted_number
	end

end
