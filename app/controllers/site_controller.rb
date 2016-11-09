class SiteController < ApplicationController
  def home
  	@phone = Phone.new
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

  def check_facebook_api
  	@check_facebook = Facebook.get_latest_entry
  end

  private

  def phone_params
	params.require(:phone).permit(:number)
  end

end

