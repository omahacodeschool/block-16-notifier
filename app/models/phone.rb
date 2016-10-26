require "sqlite3"

class Phone
	def self.format_number(phone)
		phone_number = phone.split("")

		phone_number.each do |char|
			if char == " " || char == "-" || char == "(" || char == ")"
				phone_number.delete(char)
				phone_number.delete(' ')
			end
		end		
		formatted_number = phone_number.join
		return formatted_number
	end

	def self.add_number(phone)
		number = phone.format_number
		# TODO
	end
end