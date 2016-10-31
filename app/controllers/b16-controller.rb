MyApp.get "/" do

	erb :"home"

end

MyApp.post "/submitted" do

	savePhone = Phone.add_number(params[:phone])

	redirect '/'
	erb :"home"
end

MyApp.post "/delete" do
	deleteNumber = Phone.delete(params[:deleted_number])
	redirect '/'
	erb :"home"
end

MyApp.get "/sendnotificationofspecial" do
	@saved_numbers = Array.new
	@saved_numbers = ["14026608760", "14026608760"]
	# TODO = there needs to be an array or collection of all saved phone numbers,
	# which will be retrieved from the DB once that has been set up.
	@saved_numbers.each do |element|
		sendSpecialText = Message.send_message(element)
	end
	erb :"temp"
end

MyApp.get "/testjsonresponse" do
	@testing = Special.printInfo
		binding.pry
	erb :"temp"
end
