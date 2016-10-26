MyApp.get "/" do

	addNumber = Phone.add_number
	redirect '/submitted'
	erb :"home"

end

MyApp.get "/submitted" do

	erb :"submitted"

end