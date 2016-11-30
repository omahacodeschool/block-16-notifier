class Phone < ActiveRecord::Base
	validates :number, length: { is: 11 }
	validates_format_of :number, :with => /[0-9]/

	def self.format_number(phone_params={})
		phone_number = phone_params[:number].split("")

		phone_number.each do |char|
			if char == " " || char == "-" || char == "(" || char == ")"
				phone_number.delete(char)
				phone_number.delete(' ')
			end
		end		
		formatted_number = phone_number.join
		# As of now, this method isn't actually figuring out the 1 digit.  will have to investigte why.
		
		# Maybe just reverse the conditional???
		
		if formatted_number[0] != 1
			formatted_number.insert(0, "1")
		else
		end

		return formatted_number
	end

end
