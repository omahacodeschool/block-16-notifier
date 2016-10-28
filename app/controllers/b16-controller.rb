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
	@saved_numbers = ["put real number in here", "put real number in here"]
	binding.pry
	@saved_numbers.each do |element|
		sendSpecialText = Message.send_message(element)
	end
	erb :"temp"
end