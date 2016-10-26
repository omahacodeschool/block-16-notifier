MyApp.get "/" do

	erb :"home"

end

MyApp.post "/submitted" do

	savePhone = Phone.add_number(params[:phone])

	redirect '/'

end

MyApp.post '/delete' do
	deleteNumber = Phone.delete(params[:deleted_number])
	redirect '/'
end