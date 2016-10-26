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
		newTask = DB.execute("INSERT INTO phone_numbers (phone) VALUES (#{number})")
	end

	def self.delete(deleted_number)
		number = deleted_number.format_number
		DB.execute("DELETE from phone_numbers WHERE phone = #{number}")
	end
	
end