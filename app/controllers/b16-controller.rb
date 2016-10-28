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
	sendSpecialText = Message.send_message(ENV['TWILIO_NUMBER'])
	erb :"temp"
end