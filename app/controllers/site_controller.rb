class SiteController < ApplicationController
  def home
  	@phone = 
  end

  def new
	@phone = Phone.new
  end

  def create
	@phone = phone.build(phone_params)

	if @phone.save
		flash[:notice] = "Thank you for submitting your phone number.  Look forward to hearing about Block 16's amazing specials."
		redirect_to home_path
	else
		flash[:notice] = "Uh oh...something went wrong. Please enter a valid phone number with area code"
		render :new
	end
  end

  def look_for_special
  	@new_blast = Blast.create

  end

  private

  def phone_params
	params.require(:phone).permit(:number)
  end

end


# MyApp.get "/" do

#   erb :"home"

# end

# MyApp.post "/submitted" do

#   savePhone = Phone.add_number(params[:phone])

#   redirect '/'
# end

# # MyApp.post "/delete" do
# #   deleteNumber = Phone.delete(params[:deleted_number])
# #   redirect '/'
# # end

# # MyApp.get "/sendnotificationofspecial" do
# #   @saved_numbers = Array.new
# #   @saved_numbers = [ENV["TEST_PHONE_1"], ENV["TEST_PHONE_2"]]
# #   # TODO = there needs to be an array or collection of all saved phone numbers,
# #   # which will be retrieved from the DB once that has been set up.
# #   @saved_numbers.each do |element|
# #     sendSpecialText = Message.send_message(element)
# #   end
# #   erb :"temp"
# # end

# # MyApp.get "/testjsonresponse" do
# #   @APIInfo = Special.getFacebookInfo
# #   @testing = Special.printInfo(@APIInfo)
# #   erb :"temp"
# # end
